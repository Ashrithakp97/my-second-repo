#!/bin/bash

# Assumes VAULT_TOKEN is already set by the Jenkins Vault Plugin via withVault
# and VAULT_ADDR is already set in the environment

# Enable KV v2 secret engine at path 'secret'
vault secrets enable -path=secret kv

echo "Secret engine 'secret/' (kv-v2) enabled successfully."
