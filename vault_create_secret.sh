#!/bin/bash

# Exit if any command fails
set -e

# Vault address and token are expected to be available as environment variables
VAULT_ADDR="http://43.204.144.100:8200"  # Replace with your Vault address
VAULT_role="cd4a4536-61b7-6384-1415-2956c7b0602b"  # Replace with your Vault token
VAULT_secret="1bf8a90a-c2fe-593c-9980-befd915da350"


export VAULT_ADDR=$VAULT_ADDR
export VAULT_TOKEN=$VAULT_role
export VAULT_TOKEN=$VAULT_secret
# Login (optional if Jenkins already authenticates by token)


# Create a new secret in Vault
vault kv put secret/myapp/config username="Ashritha" password="1234"

# Check if secret was created successfully (try reading it back)
SECRET_OUTPUT=$(vault kv get -field=username secret/myapp/config)

if [ "$SECRET_OUTPUT" == "Ashritha" ]; then
  echo "Secret created successfully."
else
  echo "Failed to create secret!" >&2  
  # >&2 :send the message to error output instead of normal output.
  exit 1
  # Exit the script with error code 1.(o means success, 1,2 means error)
fi
