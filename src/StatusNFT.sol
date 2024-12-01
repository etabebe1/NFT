// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {ERC721} from "@openzeppelin/"

contract StatusNFT is ERC721 {
    uint256 public s_tokenCounter;
    string public s_unverified;
    string public s_verified;

    constructor(string memory _unverified, string memory _verified) ERC721("User Status","US") {
        s_tokenCounter = 0;
        s_unverified = _unverified;
        s_verified = _verified;
    }

    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
    }
}
