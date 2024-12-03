// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {ERC721} from "@openzeppelin/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/utils/Base64.sol";
import {console} from "forge-std/console.sol";

contract StatusNFT is ERC721 {
    error StatusNFT__CannotChangeStatus();

    uint256 public s_tokenCounter;
    string public s_unverified;
    string public s_verified;

    enum Status {
        verified,
        unverified
    }

    mapping(uint256 => Status) public s_tokenIdToStatus;

    constructor(string memory _unverified, string memory _verified) ERC721("User Status", "US") {
        s_tokenCounter = 0;
        s_unverified = _unverified;
        s_verified = _verified;
    }

    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToStatus[s_tokenCounter] = Status.unverified;
        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;

        if (s_tokenIdToStatus[tokenId] == Status.unverified) {
            imageURI = s_unverified;
        } else {
            imageURI = s_verified;
        }

        bytes memory tokenMetaData = abi.encodePacked(
            _baseURI(),
            Base64.encode(
                abi.encodePacked(
                    '{"name":"',
                    name(),
                    '", "description":"An NFT legal status of the owner, 100% on Chain!", ',
                    '"attributes": [{"trait_type": "check", "value": 100}], "image":"',
                    imageURI,
                    '"}'
                )
            )
        );

        return string(tokenMetaData);
    }

    function changeState(uint256 tokenId) public {
        if (!_isAuthorized(ownerOf(tokenId), msg.sender, tokenId)) {
            revert StatusNFT__CannotChangeStatus();
        }

        console.log(tokenId);

        if (s_tokenIdToStatus[tokenId] == Status.verified) {
            s_tokenIdToStatus[tokenId] = Status.unverified;
            // console.log(s_unverified);
        } else {
            s_tokenIdToStatus[tokenId] = Status.verified;
        }
    }
}
