// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "rmrk/implementations/nativeTokenPay/RMRKNestableImpl.sol";
import "rmrk/RMRK/extension/emotable/RMRKEmotable.sol";

contract BlossomCred is RMRKNestableImpl, RMRKEmotable {
  struct Cred {
    uint256 tokenId;
    address credGiver;
    bytes32 credType;
  }

  uint256 public _tokenId;

  mapping (address => mapping(bytes32 => Cred[])) public userToCategoryToDetails;
  mapping (address => bytes32[]) public userCategories;
  mapping (address => mapping(bytes32 => bool)) public userCredFlags;

  constructor(
    string calldata name_,
    string calldata symbol_,
    string calldata collectionMetada_,
    string calldata tokenURI_,
    InitData memory data
  ) RMRKNestableImpl(
    name_,
    symbol_,
    collectionMetada_,
    tokenURI_,
    data
  ) {
    
  }

  // should this be mint? depends on RMRK tooling for accepting thingy
  function giveCred(address recipient, bytes32 credType) external {
    // needs gatekeeping logic, only someone with user/parent NFT can give
    tokenId = _tokenId++;
    _mint(recipient, tokenId, "");
    Cred memory newCred = Cred({
      tokenId: tokenId,
      credGiver: msg.sender,
      credType: credType
    });
    Cred[] memory currentCreds = userToCategoryToDetails[recipient][credType];
    currentCreds.push(newCred);
    userToCategoryToDetails[recipient][credType] = currentCreds;
    if(!userCredFlags[recipient][credType]) {
      userCredFlags[recipient][credType] = true;
    }
  }
}