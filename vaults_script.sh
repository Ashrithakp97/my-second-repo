#!/bin/bash

# Vault address and token - adjust with your environment's values
VAULT_ADDR="http://65.0.61.11:8200"  # Replace with your Vault address
VAULT_TOKEN="hvs.R1moHrfuwVcE36iGizX7Zo4O"  # Replace with your Vault token

# Secret Engine Type (e.g., kv, database, etc.)
SECRET_ENGINE="kv"
MOUNT_PATH="test"  # Path where you want to mount the engine

# Authenticate with Vault (can be skipped if token is already set in the environment)
export VAULT_ADDR=$VAULT_ADDR
export VAULT_TOKEN=$VAULT_TOKEN

# Enable the KV Secret Engine (you can choose other engines)
vault secrets enable -path=$MOUNT_PATH $SECRET_ENGINE

# Example: Write a secret to the engine
vault kv put $MOUNT_PATH/mysecret key1=ashi key2=1234

# Optionally verify by reading back the secret
vault kv get $MOUNT_PATH/mysecret
