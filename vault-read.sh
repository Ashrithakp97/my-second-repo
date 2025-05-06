#!/bin/bash

set -e

echo "Using VAULT_ADDR: $VAULT_ADDR"
echo "Reading Vault secret at path: secret/myapp/config"

# Uses VAULT_TOKEN automatically injected by Jenkins Vault plugin
vault kv get -format=json secret/myapp/config

# Optional: extract a field
username=$(vault kv get -field=username secret/myapp/config)
echo "Extracted username: $username"
