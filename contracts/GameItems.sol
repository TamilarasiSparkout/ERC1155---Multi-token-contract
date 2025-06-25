// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameItems is ERC1155, Ownable {
    // Token ID constants 
    uint256 public constant SWORD = 1;
    uint256 public constant SHIELD = 2;
    uint256 public constant POTION = 3;

constructor(address initialOwner) ERC1155("") Ownable(initialOwner) {
        // Mint some items to the deployer
        _mint(msg.sender, SWORD, 10, "");    // 10 SWORDs
        _mint(msg.sender, SHIELD, 5, "");    // 5 SHIELDs
        _mint(msg.sender, POTION, 100, "");  // 100 POTIONs
    }

    // Mint one type of token (can be NFT or FT)
    function mintSingle(address to, uint256 id, uint256 amount) external onlyOwner {
        _mint(to, id, amount, "");
    }

    // Mint multiple tokens at once (batch minting)
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts) external onlyOwner {
        _mintBatch(to, ids, amounts, "");
    }

    // Set new metadata URI (optional for dynamic metadata)
    function setURI(string memory newuri) external onlyOwner {
        _setURI(newuri);
    }
}
