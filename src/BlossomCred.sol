// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "rmrk/implementations/nativeTokenPay/RMRKNestableImpl.sol";
import "rmrk/RMRK/extension/emotable/RMRKEmotable.sol";

contract BlossomCred is RMRKNestableImpl, RMRKEmotable {
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