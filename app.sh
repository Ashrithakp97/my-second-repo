#!/bin/bash

# Fail on any error
set -e
export VAULT_ADDR="http://3.109.202.49:8200"

# These will be passed in or set as environment variables from Jenkins
ROLE_ID="$ROLE_ID"
SECRET_ID="$SECRET_ID"

# Check if required tools exist
if ! command -v vault &> /dev/null || ! command -v jq &> /dev/null; then
  echo "Vault CLI and jq must be installed."
  exit 1
fi

# Login to Vault using AppRole
echo "Logging into Vault..."
LOGIN_RESPONSE=$(vault write -format=json auth/approle/login role_id="$ROLE_ID" secret_id="$SECRET_ID")

# Extract Vault token
VAULT_TOKEN=$(echo $LOGIN_RESPONSE | jq -r '.auth.client_token')


#export VAULT_TOKEN=$(cat ./vault_token.txt)
#vault login "hvs.CAESIFA9diGjjWdiRoIHU-t-9A6Gv1FvBPQ16WNA0h8A4VDUGh4KHGh2cy5tbm5SNnlUWWM2aENLQTdOQTE2ZFkwVjg"
echo "Creating a test secret..."
vault secrets enable -path=tech -version=2 kv

vault kv put sun/testing username="admin" password="123"

echo "KV secrets engine setup complete."
