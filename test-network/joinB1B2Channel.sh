export FABRIC_CFG_PATH=$PWD/../config/

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b1.example.com/users/Admin@b1.example.com/msp
export CORE_PEER_ADDRESS=localhost:11051

peer channel create -o localhost:7050  --ordererTLSHostnameOverride orderer.example.com -c b1r1f -f ./channel-artifacts/b1r1f.tx --outputBlock ./channel-artifacts/b1r1f.block --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

peer channel join -b ./channel-artifacts/b1r1f.block

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b2.example.com/users/Admin@b2.example.com/msp
export CORE_PEER_ADDRESS=localhost:17051

peer channel fetch 0 ./channel-artifacts/b1b2.block -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -c b1b2 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

peer channel join -b ./channel-artifacts/b1b2.block