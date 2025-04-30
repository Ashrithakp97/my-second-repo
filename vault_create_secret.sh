#!/bin/bash
set -e

echo "Writing secret to Vault using token from Jenkins..."

vault kv put secret/data/myapp/config username=admin password=123456

SECRET_OUTPUT=$(vault kv get -field=username secret/myapp/config)
 
if [ "$SECRET_OUTPUT" == "Ashritha" ]; then
  echo "Secret created successfully."
else
  echo "Failed to create secret!" >&2  
  exit 1
fi
