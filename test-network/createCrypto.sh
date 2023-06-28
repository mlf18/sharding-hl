if [ -d "organizations/peerOrganizations" ]; then
    rm -Rf organizations/peerOrganizations && rm -Rf organizations/ordererOrganizations
fi

cryptogen generate --config=./custom/cryptogen-config-orgs.yaml --output="organizations"
cryptogen generate --config=./custom/cryptogen-config-orderer.yaml --output="organizations"