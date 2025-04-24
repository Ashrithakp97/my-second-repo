#!/bin/bash

# Exit on error
set -e

echo "[INFO] Starting Vault secret write process..."

# Set Vault address (change this if needed)
export VAULT_ADDR="http://127.0.0.1:8200"

# Login using root token (change for production, use AppRole or token from Jenkins env)
vault login s.YourRootTokenHere

# Put some secrets into Vault
vault kv put secret/myapp username='admin' password='pass123'

# Fetch and display the secret
vault kv get secret/myapp

echo "[SUCCESS] Vault script completed."
