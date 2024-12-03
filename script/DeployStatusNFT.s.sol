// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {StatusNFT} from "../src/StatusNFT.sol";
import {StatusConstants} from "../core/StatusConstants.sol";
import {Base64} from "@openzeppelin/utils/Base64.sol";

contract DeployStatusNFT is Script, StatusConstants {
    StatusNFT statusNFT;

    function run() external returns (StatusNFT) {
        string memory unverified_svg = vm.readFile("./images/unverified.svg");
        string memory verified_svg = vm.readFile("./images/verified.svg");

        vm.startBroadcast();
        statusNFT = new StatusNFT(
            svgToBase64URI(unverified_svg),
            svgToBase64URI(verified_svg)
        );
        vm.stopBroadcast();

        return statusNFT;
    }

    function svgToBase64URI(
        string memory svg
    ) public pure returns (string memory) {
        string memory prefix = "data:image/svg+xml;base64,";
        string memory encodedBase64svg = Base64.encode(bytes(svg));
        string memory base64Output = string(
            abi.encodePacked(prefix, encodedBase64svg)
        );

        // console.log(base64Output);

        return base64Output;
    }
}
