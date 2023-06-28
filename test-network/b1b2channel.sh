export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=${PWD}/custom
echo "Create Channel b1b2"
configtxgen -profile B1B2Channel -outputCreateChannelTx ./channel-artifacts/b1b2.tx -channelID b1b2
echo "Create B1 Join Channel b1b2"
export FABRIC_CFG_PATH=$PWD/../config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b1.example.com/users/Admin@b1.example.com/msp
export CORE_PEER_ADDRESS=localhost:11051
peer channel create -o localhost:7050  --ordererTLSHostnameOverride orderer.example.com -c b1b2 -f ./channel-artifacts/b1b2.tx --outputBlock ./channel-artifacts/b1b2.block --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"
peer channel join -b ./channel-artifacts/b1b2.block

peer channel getinfo -c b1b2

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b2.example.com/users/Admin@b2.example.com/msp
export CORE_PEER_ADDRESS=localhost:17051
peer channel create -o localhost:7020  --ordererTLSHostnameOverride orderer2.example.com -c b1b2 -f ./channel-artifacts/b1b2.tx --outputBlock ./channel-artifacts/b1b2.block --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"
peer channel join -b ./channel-artifacts/b1b2.block

peer channel getinfo -c b1b2

echo "SET ANCHOR PEER"
echo "Anchor B1"
export FABRIC_CFG_PATH=$PWD/../config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b1.example.com/users/Admin@b1.example.com/msp
export CORE_PEER_ADDRESS=localhost:11051

peer channel fetch config channel-artifacts/b1b2.pb -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c b1b2 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

cd channel-artifacts

configtxlator proto_decode --input b1b2.pb --type common.Block --output config_block.json
jq '.data.data[0].payload.data.config' config_block.json > config.json

cp config.json config_copy.json

jq '.channel_group.groups.Application.groups.B1MSP.values += {"AnchorPeers":{"mod_policy": "Admins","value":{"anchor_peers": [{"host": "peer0.b1.example.com","port": 11051}]},"version": "0"}}' config_copy.json > modified_config.json

configtxlator proto_encode --input config.json --type common.Config --output config.pb
configtxlator proto_encode --input modified_config.json --type common.Config --output modified_config.pb
configtxlator compute_update --channel_id b1b2 --original config.pb --updated modified_config.pb --output config_update.pb

configtxlator proto_decode --input config_update.pb --type common.ConfigUpdate --output config_update.json
echo '{"payload":{"header":{"channel_header":{"channel_id":"b1b2", "type":2}},"data":{"config_update":'$(cat config_update.json)'}}}' | jq . > config_update_in_envelope.json
configtxlator proto_encode --input config_update_in_envelope.json --type common.Envelope --output config_update_in_envelope.pb

cd ..

peer channel update -f channel-artifacts/config_update_in_envelope.pb -c b1b2 -o localhost:7050  --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

export FABRIC_CFG_PATH=$PWD/../config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b2.example.com/users/Admin@b2.example.com/msp
export CORE_PEER_ADDRESS=localhost:17051

peer channel fetch config channel-artifacts/b1b2.pb -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com -c b1b2 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

cd channel-artifacts

configtxlator proto_decode --input b1b2.pb --type common.Block --output config_block.json
jq '.data.data[0].payload.data.config' config_block.json > config.json

cp config.json config_copy.json

jq '.channel_group.groups.Application.groups.B2MSP.values += {"AnchorPeers":{"mod_policy": "Admins","value":{"anchor_peers": [{"host": "peer0.b2.example.com","port": 17051}]},"version": "0"}}' config_copy.json > modified_config.json

configtxlator proto_encode --input config.json --type common.Config --output config.pb
configtxlator proto_encode --input modified_config.json --type common.Config --output modified_config.pb
configtxlator compute_update --channel_id b1b2 --original config.pb --updated modified_config.pb --output config_update.pb

configtxlator proto_decode --input config_update.pb --type common.ConfigUpdate --output config_update.json
echo '{"payload":{"header":{"channel_header":{"channel_id":"b1b2", "type":2}},"data":{"config_update":'$(cat config_update.json)'}}}' | jq . > config_update_in_envelope.json
configtxlator proto_encode --input config_update_in_envelope.json --type common.Envelope --output config_update_in_envelope.pb

cd ..

peer channel update -f channel-artifacts/config_update_in_envelope.pb -c b1b2 -o localhost:7020  --ordererTLSHostnameOverride orderer2.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"