#!/bin/bash

# Exit on error
set -e

echo "[INFO] Starting Vault secret write process..."

# Set Vault address (change this if needed)
export VAULT_ADDR="http://52.66.247.151:8200"

# Login using root token (change for production, use AppRole or token from Jenkins env)
vault login hvs.6b4a9jVwyduGLrUc4pKILw95

# Put some secrets into Vault
vault kv put kv/sun username='ashu' password='1234'

# Fetch and display the secret
vault kv get kv/sun

echo "[SUCCESS] Vault script completed."
