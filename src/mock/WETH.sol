// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {ERC20} from "solmate/tokens/ERC20.sol";

contract WETH is ERC20 {
    constructor() ERC20("WETH Mock", "WETH", 18) {}

    function deposit() public payable {
        _mint(msg.sender, msg.value);
    }

    function withdraw(uint256 wad) public {
        _burn(msg.sender, wad);
        payable(msg.sender).transfer(wad);
    }

    receive() external payable {
        deposit();
    }
}
