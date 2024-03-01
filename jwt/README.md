# Databroker Example Tokens

This directory contains example tokens for demo and test purposes for KUKSA Databroker.
For more information on token format see [documentation](./authorization.md).

## Available tokens

* `actuate-provide-all.token` - gives access to set target value and actual value for all signals
* `provide-all.token` - gives access to set actual value for all signals, but not target value
* `read-all.token` - gives access to read actual and current value for all signals
* `provide-vehicle-speed.token` - gives access to write and read actual value for Vehicle.Speed. Does not give access to other signals
* `read-vehicle-speed.token` - gives access to read actual value for Vehicle.Speed. Does not give access to other signals

## Create new tokens

Two helper scripts exist for generating keys and tokens

* [recreateJWTkeyPair.sh](recreateJWTkeyPair.sh) to regenerate the JWT keys used for signing
* [createToken.py](createToken.py) to create signed tokens, requires `*.json` files as parameters

An example is shown below:

```
pip install -r requirements.txt
python -m createToken actuate-provide-all.json
```
