pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract Teacher {

  uint public averageMark = 95;
  address public teacher = 0x23Ab3aaA7EbB95C70079aaD320b25a5506b2657f;

  mapping(address => uint[8]) marks; 

  function editMark(uint mark, uint subject) public {
    require (mark >= 0 && mark <= 100, "Invalid mark");
    require (msg.sender == teacher, "Not a teacher");

    marks[address(this)][subject] = mark; 
  }
}
