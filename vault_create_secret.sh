#!/bin/bash
set -e

echo "Writing secret to Vault using token from Jenkins..."

vault kv put secret/myapp/config username="Ashritha" password="1234"

echo "Verifying Vault secret..."
vault kv get secret/myapp/config
