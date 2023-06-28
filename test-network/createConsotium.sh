if [ -f "system-genesis-block/genesis.block" ]; then
    rm system-genesis-block/genesis.block
fi
export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=${PWD}/custom
configtxgen -profile ProfileGenesis -channelID system-channel -outputBlock ./system-genesis-block/genesis.block
cd docker
docker-compose -f docker-compose-custom.yaml up -d