set -e

echo "Logging into Vault via AppRole..."

VAULT_TOKEN=$(vault write -field=token auth/approle/login role_id="$VAULT_ROLE_ID" secret_id="$VAULT_SECRET_ID")
export VAULT_TOKEN

echo "Creating secret at secret/myapp/config..."
vault kv put secret/myapp/config username=ashri password=123
