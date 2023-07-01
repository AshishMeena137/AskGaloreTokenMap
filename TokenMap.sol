//SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TokenMapping {
    using Address for address;

    mapping(address => mapping(uint256 => uint256)) public tokenMapping;

    address public erc721ContractAddress;
    address public erc20ContractAddress;

    constructor(address _erc721ContractAddress, address _erc20ContractAddress) {
        erc721ContractAddress = _erc721ContractAddress;
        erc20ContractAddress = _erc20ContractAddress;
    }

    function mapTokens(uint256 tokenId) external {
        require(ERC721(erc721ContractAddress).ownerOf(tokenId) == msg.sender, "Only token owner can map tokens");
        require(tokenMapping[msg.sender][tokenId] == 0, "Token already mapped");

        tokenMapping[msg.sender][tokenId] = 1000;

        IERC20(erc20ContractAddress).transferFrom(msg.sender, address(this), 1000);
    }

    function unmapTokens(uint256 tokenId) external {
        require(tokenMapping[msg.sender][tokenId] > 0, "Token not mapped");

        uint256 mappedTokens = tokenMapping[msg.sender][tokenId];
        tokenMapping[msg.sender][tokenId] = 0;

        IERC20(erc20ContractAddress).transfer(msg.sender, mappedTokens);
    }

    function getMappedTokens(uint256 tokenId) external view returns (uint256) {
        return tokenMapping[msg.sender][tokenId];
    }
}
