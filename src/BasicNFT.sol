// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ERC721} from "@openzeppelin/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 public s_tokenCounter;
    mapping(uint256 => string) s_tokenIdToURI;

    constructor() ERC721("AI-Generated", "AIG") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory _tokenURI) public {
        s_tokenIdToURI[s_tokenCounter] = _tokenURI;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToURI[tokenId];
    }
}
