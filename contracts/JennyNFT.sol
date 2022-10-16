// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
//import "@openzeppelin/contracts/utils/Counters.sol";


contract JennyNFT is ERC721, ERC721Enumerable, ERC721URIStorage {

    //Counters.Counter private _tokenIdCounter;
    uint currentSupply;
    uint MAX_SUPPLY = 5;

    constructor() ERC721("JENNYM", "JM") {}

    function safeMint(address to, string memory uri)
        public
        
    {
        require(currentSupply <= MAX_SUPPLY, "you can't mint more than the max");
        uint tokenId = currentSupply;
        incrementSupply();

        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function incrementSupply() public{
        currentSupply++;
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}