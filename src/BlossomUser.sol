// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "rmrk/implementations/nativeTokenPay/RMRKNestableImpl.sol";

contract BlossomUser is RMRKNestableImpl {
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
}