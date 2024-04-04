# sbom-tools

Some helper scripts supporting handling and generation of sboms.

You can install this with pip like this

```sh
pip install "git+https://github.com/eclipse-kuksa/kuksa-common.git@main#subdirectory=sbom-tools"
```

For productive deploylments in CI, you should replace `main` with a git tag or a commit hash.

## Tool: collectlicensefiles

This tool will read a CycloneDX SBOM and tries to extract the license text for all found components, collecting them into an output folder.

```txt
collectlicensefiles --help
usage: collectlicensefiles [-h] [--curation CURATION] [--log-level {DEBUG,INFO,WARNING,ERROR,CRITICAL}] sbom dir

positional arguments:
  sbom                  CycloneDX SBOM in JSON format
  dir                   Output directory

optional arguments:
  -h, --help            show this help message and exit
  --curation CURATION   Curation file
  --log-level {DEBUG,INFO,WARNING,ERROR,CRITICAL}
                        Set the log level
```

### Current limitations

The tool requires that the output folder does not exist when it starts up.

Currently the tool copies each license file once, it does currently not create a long file where it explicitely adds a license per component.

### Curations

It is possible to do curations in a YAML file, that is useful when a clean license expression can not be extraced for a specific component, or in case of dual licensed components, only include one of the possible licenses.

This is an exmple of a component curation

```yaml
components:
  ring:
    expression: "ring AND ISC AND OPENSSL"
```

This makes sure, that in case of a component named `ring`, the ring, ISC and OPENSSL licenses will be copied

This is a generic license expression

```yaml
expressions:
    "Apache-2.0 OR MIT": "Apache-2.0"
```

This makes sure, that for any component that is licensed either under Apache-2.0 or MIT license, we choose Apache-2.0 license terms.

> [!WARNING]
> There will be no sanity check whether the mapping is allowed in terms of licenses.
>

## Example files

You can find example files in [here](./example). You can run them like this

```sh
collectlicensefiles ../kuksa-common/sbom-tools/example/example.cdx.json --curation ../kuksa-common/sbom-tools/example/example-curation.yaml outputdir
```
