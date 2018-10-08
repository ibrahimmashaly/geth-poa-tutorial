#!/bin/bash
# Setups up elements to run PoA network with
# variable number of actors

## Empty list to store accounts as they are
## created.

ACCOUNTS=()

## See if local flag is there

if [ $1 == "local" ]; then
    local_flag="true"
    echo $local_flag
fi


## Function we use to create geth accounts

setup_geth_account () {

    local node_name="node$1"
    mkdir $node_name
    geth --datadir $node_name/ account new --password "./config/password.txt"
## Find account number and save in a zero-based array
    for long_name in $node_name/keystore/*; do
        # echo ${long_name:(-40)}
        short_name=${long_name:(-40)}
        echo "Created account: $short_name"

        ACCOUNTS+=($short_name)
        echo "Added $ACCOUNTS[$1] to ACCOUNTS"
        done
}


## Get number of users in the network (must be a digit)

echo "How many users are in your PoA network?"
read num_users

until [[ $((num_users)) == $num_users ]]; do
    echo "Please enter an integer!"
    read num_users
done
echo "Great! We'll set up a network for $num_users individuals"

## Setting up that number of accounts

echo "Setting up accounts..."
sleep 1

for ((i=1; i<=$((num_users));i++)); do
            
    ## Setup new account in geth
    setup_geth_account $i
    # echo $ACCOUNTS
    ## Find account number and add to list

    sleep .5
done

echo ${ACCOUNTS[@]} > "./config/poa-accounts.txt"

## Using puppeth.expect to run `puppeth`
##
## Running Puppeth to get clique consensus engine to generate genesis.json

echo "Creating Genesis Block for PoA Network..."
sleep 1

expect -f ./config/puppeth.expect $num_users ${ACCOUNTS[@]}

echo "Assembling individual starter nodes..."
sleep 1

echo "geth --datadir ./ init poa-genesis.json" > "./config/geth-init.sh"

for ((i=1; i<=$((num_users));i++)); do
            
    ## copy genesis file into directory
    cp -R poa-genesis.json node$i

    ## copy genesis init file into directory   
    cp -R ./config/geth-init.sh node$i

    ## check if user is running with "local" variable and make an appropriate start file
    if [ $local_flag="true" ]; then
        echo "geth --datadir ./ --syncmode 'full' --port ((30310+$i)) --rpc --rpcaddr 'localhost' --rpcport ((8501+$i)) --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://ea2cab82d19b0704299ff837c9e10ee90841d24503e2f6d993fafbf351d9b6a1860cb6f20eee0f35412c4c28ca68c0720f623792f24abdf2ad0d386598a5b4e2@127.0.0.1:30310' --networkid 1515 --gasprice '1' -unlock ${ACCOUNTS[(($i-1))]} --password password.txt --mine" > "./config/geth-start-local.sh"
        cp -R ./config/geth-start-local.sh node$i
        
    else
        echo "geth --datadir ./ --syncmode 'full' --port 30310 --rpc --rpcaddr 'localhost' --rpcport 8501 --rpcapi 'personal,db,eth,net,web3,txpool,miner' --bootnodes 'enode://ea2cab82d19b0704299ff837c9e10ee90841d24503e2f6d993fafbf351d9b6a1860cb6f20eee0f35412c4c28ca68c0720f623792f24abdf2ad0d386598a5b4e2@[178.128.135.172]:30310' --networkid 1515 --gasprice '1' -unlock ${ACCOUNTS[(($i-1))]} --password password.txt --mine" > "./config/geth-start.sh"
        cp -R ./config/geth-start.sh node$i
    fi

    ## copy password file
    cp -R ./config/password.txt node$i

    ## compress directory
    zip -r node$i.zip node$i/

    sleep .5
done

