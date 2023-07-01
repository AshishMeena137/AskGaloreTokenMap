//SPDX-License-Identifier: UNLICENSE
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20 {
    constructor() ERC20("ERC20Token", "E20") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function Mint(uint amount) public {
        _mint(msg.sender, amount * 10 ** decimals());
    }
}
