// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {DeployStatusNFT} from "../../script/DeployStatusNFT.s.sol";
import {StatusConstants, HardCodedSvg} from "../../core/StatusConstants.sol";

contract DeployStatusNFTTest is StatusConstants, HardCodedSvg {
    DeployStatusNFT public deployStatusNFT;

    function setUp() public {
        deployStatusNFT = new DeployStatusNFT();
    }

    function testSvgToBase64URI() public view {
        /**
         * @dev possible to use VERIFIED_SVG too
         */
        string memory expectedURI = UNVERIFIED_SVG;
        string memory actualURI = deployStatusNFT.svgToBase64URI(HARDCODED_UNVERIFIED_SVG);

        // console.log(expectedURI);
        // console.log(actualURI);

        assert((keccak256(abi.encodePacked(actualURI)) == keccak256(abi.encodePacked(expectedURI))));
    }
}
