#!/bin/bash
set -e

echo "Logging into Vault using AppRole..."

# Use correct login endpoint
VAULT_TOKEN=$(vault write -field=token auth/approle/login role_id="$VAULT_ROLE_ID" secret_id="$VAULT_SECRET_ID")
export VAULT_TOKEN

# Store secret
vault kv put secret/myapp/config username="Ashritha" password="1234"

# Retrieve secret
SECRET_OUTPUT=$(vault kv get -field=username secret/myapp/config)

if [ "$SECRET_OUTPUT" == "Ashritha" ]; then
  echo "Secret created successfully."
else
  echo "Failed to create secret!" >&2  
  exit 1
fi
