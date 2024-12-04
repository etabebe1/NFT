-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil zktest deploy-local deploy-sepolia mint-local mint-sepolia status-local status-sepolia

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

# Clean the repository
clean: 
	@forge clean

# Remove installed modules
remove:
	@rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "Remove modules"

# Install dependencies
install:
	@forge install cyfrin/foundry-devops --no-commit
	@forge install foundry-rs/forge-std@v1.8.2 --no-commit
	@forge install openzeppelin/openzeppelin-contracts@v5.0.2 --no-commit

# Update dependencies
update:
	@forge update

# Build contracts
build:
	@forge build

# Test contracts
test:
	@forge test

# ZkSync-specific tests
zktest:
	@foundryup-zksync && forge test --zksync && foundryup

# Format Solidity code
format:
	@forge fmt

# Start Anvil local blockchain
anvil:
	@anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

# Set up local and Sepolia-specific network arguments
LOCAL_NETWORK_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast
SEPOLIA_NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

# Deploy contracts
deploy-local:
	@forge script script/DeployStatusNFT.s.sol:DeployStatusNFT $(LOCAL_NETWORK_ARGS)

deploy-sepolia:
	@forge script script/DeployStatusNFT.s.sol:DeployStatusNFT $(SEPOLIA_NETWORK_ARGS)

# Mint NFTs
mint-local:
	@forge script script/Interactions.s.sol:MintBasicNFT $(LOCAL_NETWORK_ARGS)

mint-sepolia:
	@forge script script/Interactions.s.sol:MintBasicNFT $(SEPOLIA_NETWORK_ARGS)
# Using cast
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "mintNFT()" --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80


# Change status of NFTs

status-local:
	@forge script script/Interactions.s.sol:changeStatusNFT $(LOCAL_NETWORK_ARGS)

status-sepolia:
	@forge script script/Interactions.s.sol:changeStatusNFT $(SEPOLIA_NETWORK_ARGS)
# Using cast
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "changeState(uint256)" 0 --private-key 0xac0974bec39a17e36ba4a6
b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

# Deploy and interact workflow
deploy:
ifeq ($(ARGS),--network sepolia)
	@forge script script/DeployBasicNFT.s.sol:DeployBasicNFT $(SEPOLIA_NETWORK_ARGS)
else
	@forge script script/DeployBasicNFT.s.sol:DeployBasicNFT $(LOCAL_NETWORK_ARGS)
endif

mint:
ifeq ($(ARGS),--network sepolia)
	@forge script script/Interactions.s.sol:MintBasicNFT $(SEPOLIA_NETWORK_ARGS)
else
	@forge script script/Interactions.s.sol:MintBasicNFT $(LOCAL_NETWORK_ARGS)
endif

change-status:
ifeq ($(ARGS),--network sepolia)
	@forge script script/Interactions.s.sol:changeStatusNFT $(SEPOLIA_NETWORK_ARGS)
else
	@forge script script/Interactions.s.sol:changeStatusNFT $(LOCAL_NETWORK_ARGS)
endif

# Snapshot
snapshot:
	@forge snapshot

# Help menu
help:
	@echo "Available targets:"
	@echo "  clean          - Clean the repository"
	@echo "  remove         - Remove installed modules"
	@echo "  install        - Install dependencies"
	@echo "  update         - Update dependencies"
	@echo "  build          - Build contracts"
	@echo "  test           - Run tests"
	@echo "  zktest         - Run zkSync-specific tests"
	@echo "  format         - Format Solidity code"
	@echo "  anvil          - Start Anvil local blockchain"
	@echo "  deploy-local   - Deploy contracts to local Anvil chain"
	@echo "  deploy-sepolia - Deploy contracts to Sepolia"
	@echo "  mint-local     - Mint NFT on local Anvil chain"
	@echo "  mint-sepolia   - Mint NFT on Sepolia"
	@echo "  status-local   - Flip NFT status on local Anvil chain"
	@echo "  status-sepolia - Flip NFT status on Sepolia"
	@echo "  deploy         - Deploy contracts (default to local unless --network sepolia is specified)"
	@echo "  mint           - Mint NFT (default to local unless --network sepolia is specified)"
	@echo "  change-status  - Change NFT status (default to local unless --network sepolia is specified)"
	@echo "  snapshot       - Run snapshot"
