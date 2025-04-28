#!/bin/bash

# Exit if any command fails
set -e

# Vault address and token are expected to be available as environment variables

# Login (optional if Jenkins already authenticates by token)
vault login $VAULT_TOKEN

# Create a new secret in Vault
vault kv put secret/myapp/config username="Ashritha" password="1234"

# Check if secret was created successfully (try reading it back)
SECRET_OUTPUT=$(vault kv get -field=username secret/myapp/config)

if [ "$SECRET_OUTPUT" == "Ashritha" ]; then
  echo "Secret created successfully."
else
  echo "Failed to create secret!" >&2
  exit 1
fi
