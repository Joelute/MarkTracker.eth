pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract Student {

  address public Teacher = 0x23Ab3aaA7EbB95C70079aaD320b25a5506b2657f;

  uint public averageMark = 95;
  mapping(address => uint[8]) marks; 



  function updateAverageMark() public {
    uint sum = 0;
    for (uint i=0;i<marks[address(this)].length;i++) {
      sum += marks[address(this)][i];
    }
    averageMark = (sum/8);
  }

}
