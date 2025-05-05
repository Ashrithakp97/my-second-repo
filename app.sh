#!/bin/bash

# Fail on any error
set -e
export VAULT_ADDR="http://13.200.229.207:8200/"

export VAULT_TOKEN=$(cat ./vault_token.txt)
#vault login "hvs.CAESIFA9diGjjWdiRoIHU-t-9A6Gv1FvBPQ16WNA0h8A4VDUGh4KHGh2cy5tbm5SNnlUWWM2aENLQTdOQTE2ZFkwVjg"
echo "Creating a test secret..."
vault secrets enable -path=tech -version=2 kv

vault kv put sun/testing username="admin" password="123"

echo "KV secrets engine setup complete."
