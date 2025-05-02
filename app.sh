#!/bin/bash

# Fail on any error
set -e
echo "Vault token is: $VAULT_TOKEN"
vault login "$VAULT_TOKEN"
echo "Creating a test secret..."
vault secrets enable -path=sun -version=2 kv

vault kv put sun/myapp username="admin" password="123"

echo "KV secrets engine setup complete."
