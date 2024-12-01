// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract MintBasicNFT is Script {
    string private randomTokenURI =
        "ipfs://QmW6aDHtYAprDkqbeC4pXZQz1Gp4iqj1rwp53SMoGkK2dr";

    // ipfs://QmatuGJVfpyPxTnYxrazFbUnKfxuGjYQh589a3WCQW1Q1U
    // http://bafybeidtijdy6wlxne4ogmupwugz6d4vshyhdcy5b542gvntoafsfofi3u.ipfs.localhost:8080

    function run() external {
        // Get the most recent deployed contract
        address recentContract = DevOpsTools.get_most_recent_deployment(
            "BasicNFT",
            block.chainid
        );
        console.log("Recent Contract Address:", recentContract);

        mintContractNFT(recentContract);
    }

    function mintContractNFT(address _recentContract) public {
        vm.startBroadcast();
        BasicNFT(_recentContract).mintNFT(randomTokenURI);
        console.log("NFT Minted at contract:", _recentContract);
        vm.stopBroadcast();
    }
}
