// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenERC20 is ERC20 {
    uint256 defaultSupply = 1000000;
    
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        mint(msg.sender, defaultSupply);
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 18;
    }

    function burn(address account, uint256 amount) private {
        _burn(account, amount);
    }

    function burnFrom(address account, uint256 amount) public {
        burn(account, amount);
    }
}
