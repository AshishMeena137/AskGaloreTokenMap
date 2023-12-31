//SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyERC721Token is ERC721 {
    constructor() ERC721("ERC721Token", "E721") {}

    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }
}
