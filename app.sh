#!/bin/bash
set -e

echo "Using Vault Token: $VAULT_TOKEN"
vault print token
vault kv put secret/app/test username="utrfghj" password="1234"

#SECRET_OUTPUT=$(vault kv get -field=username secret/app/test)

if [ "$SECRET_OUTPUT" == "Ashritha" ]; then
  echo "Secret created successfully."
else
  echo "Failed to create secret!" >&2  
  exit 1
fi
