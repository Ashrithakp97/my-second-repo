#!/bin/bash
# vault-read.sh

VAULT_ADDR='http://127.0.0.1:8200'
ROLE_ID='your-role-id'
SECRET_ID='your-secret-id'

# Log in to Vault with AppRole
VAULT_TOKEN=$(vault write -field=token auth/approle/login role_id="$ROLE_ID" secret_id="$SECRET_ID")

# Export token
export VAULT_TOKEN
export VAULT_ADDR

# Read secret
vault kv get -format=json kv/mysecret
