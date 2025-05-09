#!/bin/bash
set -e

ROLE_ID=$1
SECRET_ID=$2
SECRET_PATH=$3
KEY1=$4
VAL1=$5
KEY2=$6
VAL2=$7

echo "Logging into Vault via AppRole..."

VAULT_TOKEN=$(vault write -field=token auth/approle/login role_id="$ROLE_ID" secret_id="$SECRET_ID")
export VAULT_TOKEN

echo "Creating secret at $SECRET_PATH..."
vault kv put "$SECRET_PATH" "$KEY1=$VAL1" "$KEY2=$VAL2"
