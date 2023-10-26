# Example Keys and Certificates and Tokens for KUKSA.val

This directory contains example keys and certificates that can be used for testing TLS support for KUKSA clients and servers.
Many of the clients and servers in this repository use keys, tokens and certificates from this directory by default.


## Keys and Certificates for TLS connections

This directory contain a set of example certificates, used by the KUKSA-project during development and testing.
They may or may not be useful for your test environment.
If needed you can customize `genCerts.sh` and generate keys and certificates that fits your environment.

See the [KUKSA TLS documentation](https://github.com/eclipse/kuksa.val//doc/tls.md) for general information on the KUKSA TLS concept.

This directory contains the following files with cryptographical information.

 Component      | Description |
| -------------- | ----------- |
| `CA.key` | Root key, tnot needed by KUKSA.val applications
| `CA.pem` | Root certificate, valid for 3650 days ( 10 years). |
| `Server.key` | Server key, needed by KUKSA.val Databroker/Server for TLS. |
| `Server.pem` | Server certificate chain, valid for 365 days, needed by KUKSA.val Databroker/Server for TLS. |
| `Client.key` | Client key, currently not needed as mutual authentication is not supported. |
| `Client.pem` | Client certificate chain, valid for 365 days, currently not needed as mutual authentication is not supported. |

If the certificates have expired or you by any other reason need to regenerate keys or certificates you can use
the `genCerts.sh` cript as described below.

### Generating Keys and Certificates for TLS Connections

Execute the script

```
> ./genCerts.sh
```

This creates `Client.pem` and `Server.pem` valid for 365 days since the day of generation.
If you want to also generate new keys, then delete the keys you want to regenerate before running the script.
This will trigger the script to generate new keys before generating the corresponding certificate.
If you want to regenerate `CA.pem` you must first delete it.

**NOTE: The script genCerts.sh may not be suitable to use for generating keys and certificates for your production environment!**

**NOTE: Please consult with your Project Security Manager (or equivalent role in your organization) on how your keys and certificates shall be generated!**


