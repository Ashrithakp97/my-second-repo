#!/bin/bash

set -e

# Jenkins Vault plugin automatically injects VAULT_TOKEN and VAULT_ADDR
echo "Using Vault at: $VAULT_ADDR"

SECRET_PATH="secret/myapp/config"

# Use Vault CLI or curl to read secret with injected token
vault read -format=json "$SECRET_PATH" || {
    echo "Vault read failed"; exit 1;
}


#vault kv put sun/testing username="admin" password="123"

#echo "KV secrets engine setup complete."
