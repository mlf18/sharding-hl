export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=${PWD}/custom
echo "Create Channel B1R1f"
configtxgen -profile B1R1FChannel -outputCreateChannelTx ./channel-artifacts/b1r1f.tx -channelID b1r1f
echo "Create B1 Join Channel B1R1f"
export FABRIC_CFG_PATH=$PWD/../config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b1.example.com/users/Admin@b1.example.com/msp
export CORE_PEER_ADDRESS=localhost:11051
peer channel create -o localhost:7050  --ordererTLSHostnameOverride orderer.example.com -c b1r1f -f ./channel-artifacts/b1r1f.tx --outputBlock ./channel-artifacts/b1r1f.block --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"
peer channel join -b ./channel-artifacts/b1r1f.block

peer channel getinfo -c b1r1f

echo "Create R1S Join Channel B1R1F"
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="R1FMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r1f.example.com/peers/peer0.r1f.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r1f.example.com/users/Admin@r1f.example.com/msp
export CORE_PEER_ADDRESS=localhost:9051

peer channel fetch 0 ./channel-artifacts/b1r1f.block -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c b1r1f --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"
peer channel join -b ./channel-artifacts/b1r1f.block

# Set Anchor Peer
echo "SET ANCHOR PEER"
echo "Anchor B1"
export FABRIC_CFG_PATH=$PWD/../config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b1.example.com/users/Admin@b1.example.com/msp
export CORE_PEER_ADDRESS=localhost:11051

peer channel fetch config channel-artifacts/b1r1f.pb -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c b1r1f --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

cd channel-artifacts

configtxlator proto_decode --input b1r1f.pb --type common.Block --output config_block.json
jq '.data.data[0].payload.data.config' config_block.json > config.json

cp config.json config_copy.json

jq '.channel_group.groups.Application.groups.B1MSP.values += {"AnchorPeers":{"mod_policy": "Admins","value":{"anchor_peers": [{"host": "peer0.b1.example.com","port": 11051}]},"version": "0"}}' config_copy.json > modified_config.json

configtxlator proto_encode --input config.json --type common.Config --output config.pb
configtxlator proto_encode --input modified_config.json --type common.Config --output modified_config.pb
configtxlator compute_update --channel_id b1r1f --original config.pb --updated modified_config.pb --output config_update.pb

configtxlator proto_decode --input config_update.pb --type common.ConfigUpdate --output config_update.json
echo '{"payload":{"header":{"channel_header":{"channel_id":"b1r1f", "type":2}},"data":{"config_update":'$(cat config_update.json)'}}}' | jq . > config_update_in_envelope.json
configtxlator proto_encode --input config_update_in_envelope.json --type common.Envelope --output config_update_in_envelope.pb

cd ..

peer channel update -f channel-artifacts/config_update_in_envelope.pb -c b1r1f -o localhost:7050  --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

echo "Anchor R1S"

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="R1FMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r1f.example.com/peers/peer0.r1f.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r1f.example.com/users/Admin@r1f.example.com/msp
export CORE_PEER_ADDRESS=localhost:9051

peer channel fetch config channel-artifacts/b1r1f.pb -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c b1r1f --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"
cd channel-artifacts

configtxlator proto_decode --input b1r1f.pb --type common.Block --output config_block.json
jq '.data.data[0].payload.data.config' config_block.json > config.json

cp config.json config_copy.json

jq '.channel_group.groups.Application.groups.R1FMSP.values += {"AnchorPeers":{"mod_policy": "Admins","value":{"anchor_peers": [{"host": "peer0.r1f.example.com","port": 9051}]},"version": "0"}}' config_copy.json > modified_config.json

configtxlator proto_encode --input config.json --type common.Config --output config.pb
configtxlator proto_encode --input modified_config.json --type common.Config --output modified_config.pb
configtxlator compute_update --channel_id b1r1f --original config.pb --updated modified_config.pb --output config_update.pb

configtxlator proto_decode --input config_update.pb --type common.ConfigUpdate --output config_update.json
echo '{"payload":{"header":{"channel_header":{"channel_id":"b1r1f", "type":2}},"data":{"config_update":'$(cat config_update.json)'}}}' | jq . > config_update_in_envelope.json
configtxlator proto_encode --input config_update_in_envelope.json --type common.Envelope --output config_update_in_envelope.pb

cd ..

peer channel update -f channel-artifacts/config_update_in_envelope.pb -c b1r1f -o localhost:7050  --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

peer channel getinfo -c b1r1f