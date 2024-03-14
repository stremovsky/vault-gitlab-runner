# vault-gitlab-runner


## Setup

```
if ! grep -q "vault" "/etc/hosts"; then
  echo "10.10.10.10 vault-server" >> /etc/hosts
fi
export VAULT_ADDR=http://vault-server
export VAULT_TOKEN=token
```

## Geterate ssh keys (private and signed key) and connect to target host

```
OUT=$(VAULT_FORMAT=json vault write generic-ssh/issue/root-user-sign-role key_type=ed25519 valid_principals=root)
echo $OUT | jq -rc '.data.private_key' > ./private
echo $OUT | jq -rc '.data.signed_key' > ./signedkey.pub
chmod 400 ./private ./signedkey.pub
echo "ssh -i ./private -i ./signedkey.pub ubuntu@target-ip"
```
