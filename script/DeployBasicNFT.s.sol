// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract DeployBasicNFT is Script {
    function run() public returns (BasicNFT) {
        vm.startBroadcast();
        BasicNFT basicNFT = new BasicNFT();
        vm.stopBroadcast();

        console.log("Deployed Contract Name: BasicNFT");
        console.log("Deployed Contract Address:", address(basicNFT));

        return basicNFT;
    }
}
