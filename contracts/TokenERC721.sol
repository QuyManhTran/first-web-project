// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./TokenERC20.sol";
contract TokenERC721 is ERC721 {
    TokenERC20 private ERC20Address;

    mapping (address => uint256) depositBalances;

    uint256 public totalSupply = 0;
    
    constructor(string memory name, string memory symbol, address _ERC20Address) ERC721(name, symbol) {
        ERC20Address = TokenERC20(_ERC20Address);
    }

    function mint(address to, uint256 tokenId) private {
        _mint(to, tokenId);
    }

    function checkOverDeposit(address account, uint256 amount) private {
        depositBalances[account] += amount;
        for(uint256 i = 0; i < depositBalances[account]/1000; i++) {
            depositBalances[account] -= 1000;
            mint(account, totalSupply++);
        }
    }

    function deposit(uint256 amount) public {
        ERC20Address.burnFrom(msg.sender, amount);
        checkOverDeposit(msg.sender, amount);
    }

    function getMyTokenIds() public view returns (uint256[] memory) {
        uint256[] memory tokenIds = new uint256[](balanceOf(msg.sender));
        uint256 j = 0;
        for(uint256 i = 0; i < totalSupply; i++) {
            if(ownerOf(i) == msg.sender) {
                tokenIds[j++] = i;
            }
        }
        return tokenIds;
    }

    function getMyDeposit() public view returns (uint256) {
        return depositBalances[msg.sender];
    }
}