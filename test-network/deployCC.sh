export PATH=${PWD}/../bin:$PATH

export FABRIC_CFG_PATH=$PWD/../config/

# peer version

# peer lifecycle chaincode package basic.tar.gz --path ../asset-transfer-basic/chaincode-go/ --lang golang --label basic_1.0

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b1.example.com/users/Admin@b1.example.com/msp
export CORE_PEER_ADDRESS=localhost:11051

# peer lifecycle chaincode install basic.tar.gz

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="R1SMSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r1s.example.com/peers/peer0.r1s.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r1s.example.com/users/Admin@r1s.example.com/msp
# export CORE_PEER_ADDRESS=localhost:7051

# peer lifecycle chaincode install basic.tar.gz

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="R1FMSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r1f.example.com/peers/peer0.r1f.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r1f.example.com/users/Admin@r1f.example.com/msp
# export CORE_PEER_ADDRESS=localhost:9051

# peer lifecycle chaincode install basic.tar.gz

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b2.example.com/users/Admin@b2.example.com/msp
export CORE_PEER_ADDRESS=localhost:17051

# peer lifecycle chaincode install basic.tar.gz

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="R2SMSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r2s.example.com/peers/peer0.r2s.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r2s.example.com/users/Admin@r2s.example.com/msp
# export CORE_PEER_ADDRESS=localhost:13051

# peer lifecycle chaincode install basic.tar.gz

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="R2FMSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r2f.example.com/peers/peer0.r2f.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r2f.example.com/users/Admin@r2f.example.com/msp
# export CORE_PEER_ADDRESS=localhost:15051

# peer lifecycle chaincode install basic.tar.gz

export CC_PACKAGE_ID=basic_1.0:3cfcf67978d6b3f7c5e0375660c995b21db19c4330946079afc3925ad7306881

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="B1MSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b1.example.com/users/Admin@b1.example.com/msp
# export CORE_PEER_ADDRESS=localhost:11051
# peer lifecycle chaincode approveformyorg -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID b1r1s --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="R1SMSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r1s.example.com/peers/peer0.r1s.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r1s.example.com/users/Admin@r1s.example.com/msp
# export CORE_PEER_ADDRESS=localhost:7051

# peer lifecycle chaincode approveformyorg -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID b1r1s --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# peer lifecycle chaincode checkcommitreadiness --channelID b1r1s --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --output json

# peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID b1r1s --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/r1s.example.com/peers/peer0.r1s.example.com/tls/ca.crt" --peerAddresses localhost:11051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt"

# peer lifecycle chaincode querycommitted --channelID b1r1s --name basic --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C b1r1s -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/r1s.example.com/peers/peer0.r1s.example.com/tls/ca.crt" --peerAddresses localhost:11051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt"

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="B1MSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b1.example.com/users/Admin@b1.example.com/msp
# export CORE_PEER_ADDRESS=localhost:11051

# peer lifecycle chaincode approveformyorg -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID b1r1f --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="R1FMSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r1f.example.com/peers/peer0.r1f.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r1f.example.com/users/Admin@r1f.example.com/msp
# export CORE_PEER_ADDRESS=localhost:9051

# peer lifecycle chaincode approveformyorg -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID b1r1f --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# peer lifecycle chaincode checkcommitreadiness --channelID b1r1f --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --output json

# peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID b1r1f --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/r1f.example.com/peers/peer0.r1f.example.com/tls/ca.crt" --peerAddresses localhost:11051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt"

# peer lifecycle chaincode querycommitted --channelID b1r1f --name basic --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C b1r1f -n basic --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/r1f.example.com/peers/peer0.r1f.example.com/tls/ca.crt" --peerAddresses localhost:11051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt" -c '{"function":"InitLedger","Args":[]}'

# #----------------------------------------------------


# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="B2MSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b2.example.com/users/Admin@b2.example.com/msp
# export CORE_PEER_ADDRESS=localhost:17051

# peer lifecycle chaincode approveformyorg -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --channelID b2r2s --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="R2SMSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r2s.example.com/peers/peer0.r2s.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r2s.example.com/users/Admin@r2s.example.com/msp
# export CORE_PEER_ADDRESS=localhost:13051

# peer lifecycle chaincode approveformyorg -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --channelID b2r2s --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# peer lifecycle chaincode checkcommitreadiness --channelID b2r2s --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --output json

# peer lifecycle chaincode commit -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --channelID b2r2s --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --peerAddresses localhost:13051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/r2s.example.com/peers/peer0.r2s.example.com/tls/ca.crt" --peerAddresses localhost:17051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt"

# peer lifecycle chaincode querycommitted --channelID b2r2s --name basic --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# peer chaincode invoke -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C b2r2s -n basic --peerAddresses localhost:13051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/r2s.example.com/peers/peer0.r2s.example.com/tls/ca.crt" --peerAddresses localhost:17051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt" -c '{"function":"InitLedger","Args":[]}'

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="B2MSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b2.example.com/users/Admin@b2.example.com/msp
# export CORE_PEER_ADDRESS=localhost:17051

# peer lifecycle chaincode approveformyorg -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --channelID b2r2f --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="R2FMSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/r2f.example.com/peers/peer0.r2f.example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/r2f.example.com/users/Admin@r2f.example.com/msp
# export CORE_PEER_ADDRESS=localhost:15051

# peer lifecycle chaincode approveformyorg -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --channelID b2r2f --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# peer lifecycle chaincode checkcommitreadiness --channelID b2r2f --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --output json

# peer lifecycle chaincode commit -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --channelID b2r2f --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --peerAddresses localhost:15051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/r2f.example.com/peers/peer0.r2f.example.com/tls/ca.crt" --peerAddresses localhost:17051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt"

# peer lifecycle chaincode querycommitted --channelID b2r2f --name basic --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

# peer chaincode invoke -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C b2r2f -n basic --peerAddresses localhost:15051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/r2f.example.com/peers/peer0.r2f.example.com/tls/ca.crt" --peerAddresses localhost:17051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt" -c '{"function":"InitLedger","Args":[]}'










export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B2MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b2.example.com/users/Admin@b2.example.com/msp
export CORE_PEER_ADDRESS=localhost:17051

peer lifecycle chaincode approveformyorg -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --channelID b1b2 --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="B1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/b1.example.com/users/Admin@b1.example.com/msp
export CORE_PEER_ADDRESS=localhost:11051

peer lifecycle chaincode approveformyorg -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID b1b2 --name basic --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

peer lifecycle chaincode checkcommitreadiness --channelID b1b2 --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --output json

peer lifecycle chaincode commit -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --channelID b1b2 --name basic --version 1.0 --sequence 1 --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" --peerAddresses localhost:11051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt" --peerAddresses localhost:17051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt"

peer lifecycle chaincode querycommitted --channelID b1b2 --name basic --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"

peer chaincode invoke -o localhost:7020 --ordererTLSHostnameOverride orderer2.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer2.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C b1b2 -n basic --peerAddresses localhost:11051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b1.example.com/peers/peer0.b1.example.com/tls/ca.crt" --peerAddresses localhost:17051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/b2.example.com/peers/peer0.b2.example.com/tls/ca.crt" -c '{"function":"InitLedger","Args":[]}'