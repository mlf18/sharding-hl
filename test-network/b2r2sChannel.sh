export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=${PWD}/custom
echo "Create Channel B2R2S"
configtxgen -profile B2R2SChannel -outputCreateChannelTx ./channel-artifacts/b2r2s.tx -channelID b2r2s
echo "Create B1 Join Channel B2R2S"
export FABRIC_CFG_PATH=$PWD/../config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b2.example.com/users/Admin@b2.example.com/msp
export CORE_PEER_ADDRESS=localhost:17051
peer channel create -o localhost:7020  --ordererTLSHostnameOverride orderer2.example.com -c b2r2s -f ./channel-artifacts/b2r2s.tx --outputBlock ./channel-artifacts/b2r2s.block --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"
peer channel join -b ./channel-artifacts/b2r2s.block

peer channel getinfo -c b2r2s

echo "Create R1S Join Channel B2R2S"
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="R2SMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r2s.example.com/peers/peer0.r2s.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r2s.example.com/users/Admin@r2s.example.com/msp
export CORE_PEER_ADDRESS=localhost:13051

peer channel fetch 0 ./channel-artifacts/b2r2s.block -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com -c b2r2s --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"
peer channel join -b ./channel-artifacts/b2r2s.block

# Set Anchor Peer
echo "SET ANCHOR PEER"
echo "Anchor B2"
export FABRIC_CFG_PATH=$PWD/../config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b2.example.com/users/Admin@b2.example.com/msp
export CORE_PEER_ADDRESS=localhost:17051

peer channel fetch config channel-artifacts/b2r2s.pb -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com -c b2r2s --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

cd channel-artifacts

configtxlator proto_decode --input b2r2s.pb --type common.Block --output config_block.json
jq '.data.data[0].payload.data.config' config_block.json > config.json

cp config.json config_copy.json

jq '.channel_group.groups.Application.groups.B2MSP.values += {"AnchorPeers":{"mod_policy": "Admins","value":{"anchor_peers": [{"host": "peer0.b2.example.com","port": 17051}]},"version": "0"}}' config_copy.json > modified_config.json

configtxlator proto_encode --input config.json --type common.Config --output config.pb
configtxlator proto_encode --input modified_config.json --type common.Config --output modified_config.pb
configtxlator compute_update --channel_id b2r2s --original config.pb --updated modified_config.pb --output config_update.pb

configtxlator proto_decode --input config_update.pb --type common.ConfigUpdate --output config_update.json
echo '{"payload":{"header":{"channel_header":{"channel_id":"b2r2s", "type":2}},"data":{"config_update":'$(cat config_update.json)'}}}' | jq . > config_update_in_envelope.json
configtxlator proto_encode --input config_update_in_envelope.json --type common.Envelope --output config_update_in_envelope.pb

cd ..

peer channel update -f channel-artifacts/config_update_in_envelope.pb -c b2r2s -o localhost:7020  --ordererTLSHostnameOverride orderer2.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

echo "Anchor R1S"

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="R2SMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r2s.example.com/peers/peer0.r2s.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r2s.example.com/users/Admin@r2s.example.com/msp
export CORE_PEER_ADDRESS=localhost:13051

peer channel fetch config channel-artifacts/b2r2s.pb -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com -c b2r2s --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"
cd channel-artifacts

configtxlator proto_decode --input b2r2s.pb --type common.Block --output config_block.json
jq '.data.data[0].payload.data.config' config_block.json > config.json

cp config.json config_copy.json

jq '.channel_group.groups.Application.groups.R2SMSP.values += {"AnchorPeers":{"mod_policy": "Admins","value":{"anchor_peers": [{"host": "peer0.r2s.example.com","port": 13051}]},"version": "0"}}' config_copy.json > modified_config.json

configtxlator proto_encode --input config.json --type common.Config --output config.pb
configtxlator proto_encode --input modified_config.json --type common.Config --output modified_config.pb
configtxlator compute_update --channel_id b2r2s --original config.pb --updated modified_config.pb --output config_update.pb

configtxlator proto_decode --input config_update.pb --type common.ConfigUpdate --output config_update.json
echo '{"payload":{"header":{"channel_header":{"channel_id":"b2r2s", "type":2}},"data":{"config_update":'$(cat config_update.json)'}}}' | jq . > config_update_in_envelope.json
configtxlator proto_encode --input config_update_in_envelope.json --type common.Envelope --output config_update_in_envelope.pb

cd ..

peer channel update -f channel-artifacts/config_update_in_envelope.pb -c b2r2s -o localhost:7020  --ordererTLSHostnameOverride orderer2.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

peer channel getinfo -c b2r2s