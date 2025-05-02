#!/bin/bash

# Fail on any error
set -e
echo "Vault token is: $VAULT_TOKEN"
vault login "hvs.CAESIFA9diGjjWdiRoIHU-t-9A6Gv1FvBPQ16WNA0h8A4VDUGh4KHGh2cy5tbm5SNnlUWWM2aENLQTdOQTE2ZFkwVjg"
echo "Creating a test secret..."
vault secrets enable -path=ashi -version=2 kv

vault kv put ashi/techapp username="admin" password="123"

echo "KV secrets engine setup complete."
