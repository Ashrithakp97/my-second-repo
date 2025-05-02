#!/bin/bash

# Fail on any error
set -e

echo "Creating a test secret..."
vault secrets enable -path=kv-v2

vault kv put kv-v2/app/test username="admin" password="password123"

echo "KV secrets engine setup complete."
