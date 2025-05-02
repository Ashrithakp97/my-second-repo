#!/bin/bash

# Fail on any error
set -e

echo "Enabling KV v2 secrets engine at 'secret/'..."

vault secrets enable -path=secret kv-v2 || {
    echo "Secrets engine may already be enabled — continuing."
}

echo "Creating a test secret..."

vault kv put secret/app/test username="admin" password="password123"

echo "KV secrets engine setup complete."
