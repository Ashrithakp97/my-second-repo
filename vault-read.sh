#!/bin/bash

set -e

echo "Using VAULT_ADDR: $VAULT_ADDR"
ROLE_ID="$ROLE_ID"
SECRET_ID="$SECRET_ID"
LOGIN_RESPONSE=$(vault write -format=json auth/approle/login role_id="$ROLE_ID" secret_id="$SECRET_ID")
VAULT_TOKEN=$(echo $LOGIN_RESPONSE)
echo "Reading Vault secret at path: secret/myapp/config"

# Uses VAULT_TOKEN automatically injected by Jenkins Vault plugin
vault kv get -format=json secret/myapp/config

# Optional: extract a field
username=$(vault kv get -field=username secret/myapp/config)
echo "Extracted username: $username"
