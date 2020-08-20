./cluster.sh create network
./cluster.sh create config
./cluster.sh setup vault_1
./cluster.sh setup vault_2
./cluster.sh setup vault_3
./cluster.sh setup vault_4

sleep 10

# Stop vault_2 (leader)
./cluster.sh stop vault_2

# Wait for election
sleep 5

# Start vault_5 (same nodeid as vault_2 but different ip)
./cluster.sh start vault_5

token=$(cat root_token-vault_2)
echo export VAULT_TOKEN=\"$token\"
echo export VAULT_ADDR="http://127.0.0.3:8200"
