#!/bin/bash
set -e
 
echo "Logging into Vault using AppRole..."
# by using role id and secret id vault is logged in

 
vault kv put secret/myapp/config username="Ashritha" password="1234"
 
SECRET_OUTPUT=$(vault kv get -field=username secret/myapp/config)
 
if [ "$SECRET_OUTPUT" == "Ashritha" ]; then
  echo "Secret created successfully."
else
  echo "Failed to create secret!" >&2  
  exit 1
fi
