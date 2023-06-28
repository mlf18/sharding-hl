export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="R1FMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r1f.example.com/peers/peer0.r1f.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r1f.example.com/users/Admin@r1f.example.com/msp
export CORE_PEER_ADDRESS=localhost:9051