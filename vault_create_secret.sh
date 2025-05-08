#!/bin/bash
set -e
 
echo "Logging into Vault using AppRole..."
# by using role id and secret id vault is logged in
VAULT_TOKEN=$(vault write -field=token auth/approle/login role_id="$VAULT_ROLE_ID" secret_id="$VAULT_SECRET_ID")
# receiving an access pass (the token), which you save in the variable VAULT_TOKEN.
export VAULT_TOKEN
 echo VAULT_TOKEN
vault kv put secret/myapp/config username="Ashritha" password="1234"
 
SECRET_OUTPUT=$(vault kv get -field=username secret/myapp/config)
 
if [ "$SECRET_OUTPUT" == "Ashritha" ]; then
  echo "Secret created successfully."
else
  echo "Failed to create secret!" >&2  
  exit 1
fi
