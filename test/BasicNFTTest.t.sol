// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";

contract BasicNFTTest is Test {
    BasicNFT public basicNFT;
    address USER = makeAddr("user");

    string private randomTokenURI = "ipfs://QmW6aDHtYAprDkqbeC4pXZQz1Gp4iqj1rwp53SMoGkK2dr";

    function setUp() public {
        DeployBasicNFT deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    function testNFTName() public view {
        string memory expectedName = "AI-Generated";
        string memory actualName = basicNFT.name();

        assert(keccak256(bytes(expectedName)) == keccak256(bytes(actualName)));
    }

    function testTokenCounterInitially() public view {
        assert(basicNFT.s_tokenCounter() == 0);
    }

    function testMintNFT() public {
        vm.prank(USER);
        basicNFT.mintNFT(randomTokenURI);

        assert(keccak256(abi.encodePacked(randomTokenURI)) == keccak256(abi.encodePacked(basicNFT.tokenURI(0))));
    }
}
