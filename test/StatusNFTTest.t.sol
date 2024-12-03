// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {StatusNFT} from "../src/StatusNFT.sol";
import {Base64} from "@openzeppelin/utils/Base64.sol";
import {StatusConstants} from "../script/DeployStatusNFT.s.sol";

contract StatusNFTTest is Test, StatusConstants {
    StatusNFT statusNFT;
    uint256 public SEND_VALUE = 100 ether;

    address minterUser = makeAddr("miter");

    function setUp() public {
        statusNFT = new StatusNFT(UNVERIFIED_SVG, VERIFIED_SVG);
    }

    function testTokenURI() public {
        vm.prank(minterUser);
        statusNFT.mintNFT();

        // console.log(minterUser);

        string memory uri = statusNFT.tokenURI(0);

        // Expected Metadata
        string memory expectedMetadata = string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(
                    abi.encodePacked(
                        '{"name":"User Status", "description":"An NFT legal status of the owner, 100% on Chain!", ',
                        '"attributes": [{"trait_type": "check", "value": 100}], ',
                        '"image":"',
                        UNVERIFIED_SVG,
                        '"}'
                    )
                )
            )
        );

        // // Assert that the tokenURI matches the expected metadata
        assertEq(
            uri,
            expectedMetadata,
            "Token URI does not match expected metadata."
        );
    }
}
