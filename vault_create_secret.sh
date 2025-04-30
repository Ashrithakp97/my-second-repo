#!/bin/bash
set -e
VAULT_TOKEN=$(vault write -field=token auth/approle/login role_id="Role ID" secret_id="Secret ID")
# receiving an access pass (the token), which you save in the variable VAULT_TOKEN.
export VAULT_TOKEN
echo "Writing secret to Vault using token from Jenkins..."

vault write secret/myapp config=username=ashritha password=secure123 token=$VAULT_TOKEN

SECRET_OUTPUT=$(vault kv get -field=username secret/myapp/config)
 
if [ "$SECRET_OUTPUT" == "Ashritha" ]; then
  echo "Secret created successfully."
else
  echo "Failed to create secret!" >&2  
  exit 1
fi
