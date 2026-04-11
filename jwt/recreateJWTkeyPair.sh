#!/bin/bash
#
# Copyright (c) 2020-2026 Contributors to the Eclipse Foundation
#
# This program and the accompanying materials are made available under the
# terms of the Apache License 2.0 which is available at
# http://www.apache.org/licenses/LICENSE-2.0
#
# SPDX-License-Identifier: Apache-2.0

ALGORITHM="ES256"

usage() {
    echo "Usage: $0 [--algorithm <ES256|EdDSA|RS256>]"
    echo ""
    echo "  --algorithm   Key type to generate (default: ES256)"
    echo "                ES256  - ECDSA with P-256 curve"
    echo "                EdDSA  - Edwards-curve DSA (Ed25519)"
    echo "                RS256  - RSA 4096-bit"
    exit 1
}

while [ $# -gt 0 ]; do
    case "$1" in
        --algorithm)
            ALGORITHM="$2"
            shift 2
            ;;
        --help|-h)
            usage
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done

case "$ALGORITHM" in
    ES256|EdDSA|RS256) ;;
    *)
        echo "Error: unsupported algorithm '$ALGORITHM'. Choose ES256, EdDSA, or RS256."
        exit 1
        ;;
esac

echo "Recreating KUKSA key pair used for JWT verification"
echo "-------------------------------------------------------"
echo "Algorithm: $ALGORITHM"

case "$ALGORITHM" in
    ES256)
        printf "\nCreating private key (ECDSA P-256)\n"
        openssl genpkey -algorithm EC -pkeyopt ec_paramgen_curve:P-256 -out jwt.key

        printf "\nCreating public key\n"
        openssl pkey -in jwt.key -pubout -out jwt.key.pub
        ;;
    EdDSA)
        printf "\nCreating private key (Ed25519)\n"
        openssl genpkey -algorithm Ed25519 -out jwt.key

        printf "\nCreating public key\n"
        openssl pkey -in jwt.key -pubout -out jwt.key.pub
        ;;
    RS256)
        printf "\nCreating private key (RSA 4096)\n"
        openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out jwt.key

        printf "\nCreating public key\n"
        openssl pkey -in jwt.key -pubout -out jwt.key.pub
        ;;
esac

printf '\nYou can use the PRIVATE key "jwt.key" to generate new tokens using https://jwt.io or the "createToken.py" script.\n'
echo 'You need to give the PUBLIC key "jwt.key.pub" to the KUKSA Databroker, so it can verify correctly signed JWT tokens.'
