// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {StatusNFT} from "../src/StatusNFT.sol";
import {Base64} from "@openzeppelin/utils/Base64.sol";

abstract contract StatusConstants {
    string public constant UNVERIFIED_SVG =
        "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IS0tIFVwbG9hZGVkIHRvOiBTVkcgUmVwbywgd3d3LnN2Z3JlcG8uY29tLCBHZW5lcmF0b3I6IFNWRyBSZXBvIE1peGVyIFRvb2xzIC0tPg0KPHN2ZyB3aWR0aD0iODAwcHgiIGhlaWdodD0iODAwcHgiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCjxwYXRoIGQ9Ik04LjUgMTIuNUwxMC41IDE0LjVMMTUuNSA5LjUiIHN0cm9rZT0iIzFDMjc0QyIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPg0KPHBhdGggZD0iTTMuMDI5MDcgMTMuMDc3NkMyLjcwMzIgMTIuMzk1OCAyLjcwMzIgMTEuNjAzMiAzLjAyOTA3IDEwLjkyMTRDMy4xNjk5NyAxMC42MjY2IDMuNDEwMjMgMTAuMzQ0NyAzLjg5MDc2IDkuNzgwODRDNC4wODIwMSA5LjU1NjQyIDQuMTc3NjQgOS40NDQyMSA0LjI1Nzk2IDkuMzI0MzdDNC40NDIwOSA5LjA0OTY1IDQuNTY5ODggOC43NDExNCA0LjYzMzkzIDguNDE2NjlDNC42NjE4OCA4LjI3NTE1IDQuNjczNiA4LjEyODE5IDQuNjk3MDYgNy44MzQyNkM0Ljc1NTk5IDcuMDk1NzYgNC43ODU0NiA2LjcyNjUxIDQuODk0MjcgNi40MTg0NEM1LjE0NTk0IDUuNzA1OTEgNS43MDY0IDUuMTQ1NDYgNi40MTg5MyA0Ljg5Mzc4QzYuNzI2OTkgNC43ODQ5NyA3LjA5NjI1IDQuNzU1NSA3LjgzNDc1IDQuNjk2NTdDOC4xMjg2OCA0LjY3MzEyIDguMjc1NjQgNC42NjEzOSA4LjQxNzE4IDQuNjMzNDRDOC43NDE2MyA0LjU2OTM5IDkuMDUwMTQgNC40NDE2IDkuMzI0ODUgNC4yNTc0N0M5LjQ0NDcgNC4xNzcxNSA5LjU1NjkxIDQuMDgxNTIgOS43ODEzMyAzLjg5MDI3QzEwLjM0NTIgMy40MDk3NCAxMC42MjcxIDMuMTY5NDggMTAuOTIxOSAzLjAyODU5QzExLjYwMzcgMi43MDI3MSAxMi4zOTYzIDIuNzAyNzEgMTMuMDc4MSAzLjAyODU5QzEzLjM3MjkgMy4xNjk0OCAxMy42NTQ4IDMuNDA5NzQgMTQuMjE4NyAzLjg5MDI3QzE0LjQ0MzEgNC4wODE1MiAxNC41NTUzIDQuMTc3MTUgMTQuNjc1MiA0LjI1NzQ3QzE0Ljk0OTkgNC40NDE2IDE1LjI1ODQgNC41NjkzOSAxNS41ODI4IDQuNjMzNDRDMTUuNzI0NCA0LjY2MTM5IDE1Ljg3MTMgNC42NzMxMiAxNi4xNjUzIDQuNjk2NTdDMTYuOTAzOCA0Ljc1NTUgMTcuMjczIDQuNzg0OTcgMTcuNTgxMSA0Ljg5Mzc4QzE4LjI5MzYgNS4xNDU0NiAxOC44NTQxIDUuNzA1OTEgMTkuMTA1OCA2LjQxODQ0TTQuODk0MjcgMTcuNTgwNkM1LjE0NTk0IDE4LjI5MzEgNS43MDY0IDE4Ljg1MzYgNi40MTg5MyAxOS4xMDUzQzYuNzI2OTkgMTkuMjE0MSA3LjA5NjI1IDE5LjI0MzUgNy44MzQ3NSAxOS4zMDI1QzguMTI4NjggMTkuMzI1OSA4LjI3NTY0IDE5LjMzNzcgOC40MTcxOCAxOS4zNjU2QzguNzQxNjMgMTkuNDI5NyA5LjA1MDE0IDE5LjU1NzQgOS4zMjQ4NSAxOS43NDE2QzkuNDQ0NjkgMTkuODIxOSA5LjU1NjkxIDE5LjkxNzUgOS43ODEzMyAyMC4xMDg4QzEwLjM0NTIgMjAuNTg5MyAxMC42MjcxIDIwLjgyOTYgMTAuOTIxOSAyMC45NzA1QzExLjYwMzcgMjEuMjk2MyAxMi4zOTYzIDIxLjI5NjMgMTMuMDc4MSAyMC45NzA1QzEzLjM3MjkgMjAuODI5NiAxMy42NTQ4IDIwLjU4OTMgMTQuMjE4NyAyMC4xMDg4QzE0LjQ0MzEgMTkuOTE3NSAxNC41NTUzIDE5LjgyMTkgMTQuNjc1MiAxOS43NDE2QzE0Ljk0OTkgMTkuNTU3NCAxNS4yNTg0IDE5LjQyOTcgMTUuNTgyOCAxOS4zNjU2QzE1LjcyNDQgMTkuMzM3NyAxNS44NzEzIDE5LjMyNTkgMTYuMTY1MyAxOS4zMDI1QzE2LjkwMzggMTkuMjQzNSAxNy4yNzMgMTkuMjE0MSAxNy41ODExIDE5LjEwNTNDMTguMjkzNiAxOC44NTM2IDE4Ljg1NDEgMTguMjkzMSAxOS4xMDU4IDE3LjU4MDZDMTkuMjE0NiAxNy4yNzI1IDE5LjI0NCAxNi45MDMzIDE5LjMwMyAxNi4xNjQ4QzE5LjMyNjQgMTUuODcwOSAxOS4zMzgxIDE1LjcyMzkgMTkuMzY2MSAxNS41ODI0QzE5LjQzMDEgMTUuMjU3OSAxOS41NTc5IDE0Ljk0OTQgMTkuNzQyMSAxNC42NzQ3QzE5LjgyMjQgMTQuNTU0OCAxOS45MTggMTQuNDQyNiAyMC4xMDkzIDE0LjIxODJDMjAuNTg5OCAxMy42NTQzIDIwLjgzMDEgMTMuMzcyNCAyMC45NzEgMTMuMDc3NkMyMS4yOTY4IDEyLjM5NTggMjEuMjk2OCAxMS42MDMyIDIwLjk3MSAxMC45MjE0IiBzdHJva2U9IiMxQzI3NEMiIHN0cm9rZS13aWR0aD0iMS41IiBzdHJva2UtbGluZWNhcD0icm91bmQiLz4NCjwvc3ZnPg==";
    string public constant VERIFIED_SVG =
        "data:image/svg+xml;base64,D94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IS0tIFVwbG9hZGVkIHRvOiBTVkcgUmVwbywgd3d3LnN2Z3JlcG8uY29tLCBHZW5lcmF0b3I6IFNWRyBSZXBvIE1peGVyIFRvb2xzIC0tPgo8c3ZnIHdpZHRoPSI4MDBweCIgaGVpZ2h0PSI4MDBweCIgdmlld0JveD0iMCAwIDE2IDE2IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9IiMwMDAwMDAiPjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNNy42NyAxNC43MmguNzFMMTAuMSAxM2gyLjRsLjUtLjV2LTIuNDJsMS43NC0xLjcydi0uNzFsLTEuNzEtMS43MlYzLjQ5bC0uNS0uNDlIMTAuMUw4LjM4IDEuMjloLS43MUw2IDNIMy41M0wzIDMuNXYyLjQzTDEuMzEgNy42NXYuNzFMMyAxMC4wOHYyLjQybC41My41SDZsMS42NyAxLjcyek02LjE2IDEySDRWOS44N2wtLjEyLS4zNUwyLjM3IDhsMS40OC0xLjUxLjE1LS4zNVY0aDIuMTZsLjM2LS4xNEw4IDIuMzVsMS41NCAxLjUxLjM1LjE0SDEydjIuMTRsLjE3LjM1TDEzLjY5IDhsLTEuNTUgMS41Mi0uMTQuMzVWMTJIOS44OWwtLjM4LjE1TDggMTMuNjZsLTEuNDgtMS41Mi0uMzYtLjE0em0xLjQ0My01Ljg1OWEuOTYyLjk2MiAwIDAgMC0uMTI4LjI5MWMtLjAzLjEwOS0uMDUuMjE1LS4wNjIuMzE3bC0uMDA1LjA0M2gtLjg5NWwuMDAzLS4wNTFjLjAxOC0uMzI2LjA4OS0uNjE1LjIxMi0uODY0LjA1Mi0uMTA4LjExNy0uMjE0LjE5My0uMzE4LjA4MS0uMTA2LjE4LS4yLjI5NC0uMjguMTE5LS4wODQuMjU1LS4xNS40MDktLjJBMS43MSAxLjcxIDAgMCAxIDguMTY1IDVjLjI4IDAgLjUyMy4wNDYuNzI2LjE0LjIuMDg5LjM2Ni4yMS40OTQuMzYzLjEyNy4xNTIuMjIuMzI2LjI3OS41Mi4wNTguMTk0LjA4Ny4zOTQuMDg3LjU5OSAwIC4xOTEtLjAzMi4zNzEtLjA5OC41NC0uMDY0LjE2NC0uMTQzLjMyLS4yMzguNDY2LS4wOTQuMTQzLS4xOTcuMjgtLjMxLjQxLS4xMS4xMjktLjIxMS4yNTItLjMwNC4zNzJhMi40NyAyLjQ3IDAgMCAwLS4yMy4zNC42NTMuNjUzIDAgMCAwLS4wODguMzE4di40OGgtLjg4OHYtLjUzOWMwLS4xNjguMDMxLS4zMjMuMDk0LS40NjRhMi4xNSAyLjE1IDAgMCAxIC4yNC0uNDAxYy4wOTYtLjEyNy4yLS4yNS4zMDgtLjM2OGE0Ljc0IDQuNzQgMCAwIDAgLjI5OS0uMzU2Yy4wOTMtLjEyLjE3LS4yNDYuMjI4LS4zNzdhLjk4NC45ODQgMCAwIDAgLjA5LS40MjEgMS4wNCAxLjA0IDAgMCAwLS4wNDctLjMxOHYtLjAwMWEuNjM4LjYzOCAwIDAgMC0uMTMtLjI0My41NTguNTU4IDAgMCAwLS4yMTYtLjE1OEg4LjQ2YS42ODkuNjg5IDAgMCAwLS4yOTQtLjA1OS42NDMuNjQzIDAgMCAwLS4zMzkuMDgzLjc0Mi43NDIgMCAwIDAtLjIyMy4yMTV6TTguNSAxMWgtLjg4OHYtLjg4OEg4LjVWMTF6Ii8+PC9zdmc+";
}

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
        assertEq(uri, expectedMetadata, "Token URI does not match expected metadata.");
    }
}
