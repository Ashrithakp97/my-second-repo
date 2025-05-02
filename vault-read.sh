#!/bin/bash

# Set Vault address
VAULT_ADDR='http://127.0.0.1:8200'

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

echo "Successfully logged in to Vault."

# Read secret from KV v2 path
SECRET_PATH="secret/data/myapp" # For KV v2
SECRET_JSON=$(vault read -format=json -address=$VAULT_ADDR -token=$VAULT_TOKEN "$SECRET_PATH")

# Parse values
USERNAME=$(echo "$SECRET_JSON" | jq -r '.data.data.username')
PASSWORD=$(echo "$SECRET_JSON" | jq -r '.data.data.password')

echo "Vault Username: $USERNAME"
echo "Vault Password: $PASSWORD"

