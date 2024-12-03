// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {StatusNFT} from "../../src/StatusNFT.sol";
import {Base64} from "@openzeppelin/utils/Base64.sol";
import {StatusConstants} from "../../core/StatusConstants.sol";
import {DeployStatusNFT} from "../../script/DeployStatusNFT.s.sol";

contract StatusNFTIntegrationTest is Test, StatusConstants {
    StatusNFT statusNFT;
    DeployStatusNFT deployer;
    uint256 public SEND_VALUE = 100 ether;

    address minterUser = makeAddr("miter");

    function setUp() public {
        deployer = new DeployStatusNFT();
        statusNFT = deployer.run();
    }

    function testTokenURIIntegration() public {
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

        // Assert that the tokenURI matches the expected metadata
        assertEq(uri, expectedMetadata, "Token URI does not match expected metadata.");
    }

    function testChangeTokenToUnverified() public {
        vm.prank(minterUser);
        vm.deal(minterUser, SEND_VALUE);
        statusNFT.mintNFT();

        vm.prank(minterUser);
        statusNFT.changeState(0);
        string memory uri = statusNFT.tokenURI(0);
        bytes memory expectedMetadata = abi.encodePacked(
            "data:application/json;base64,",
            Base64.encode(
                abi.encodePacked(
                    '{"name":"',
                    "User Status",
                    '", "description":"An NFT legal status of the owner, 100% on Chain!", ',
                    '"attributes": [{"trait_type": "check", "value": 100}], "image":"',
                    VERIFIED_SVG,
                    '"}'
                )
            )
        );

        assertEq(keccak256(abi.encodePacked(uri)), keccak256(abi.encodePacked(abi.encodePacked(expectedMetadata))));
    }
}
