#!/bin/bash

# Fail on any error
set -e

echo "Enabling KV v2 secrets engine at 'secret/'..."

echo "Creating a test secret..."

vault kv put secret/app/test username="admin" password="password123"

echo "KV secrets engine setup complete."
