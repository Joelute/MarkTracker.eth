pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract Teacher {

  // Change subject to a string
  address teacher = 0x23Ab3aaA7EbB95C70079aaD320b25a5506b2657f;
  address public Student;

  mapping(address => uint[8]) marks; 

  function select_student(address _student) public {
    Student = _student;
  }

  function edit_mark(uint mark, uint subject) public {
    require (mark >= 0 && mark <= 100, "Invalid mark");
    require (subject >=0 && subject <=7, "Invalid subject"); 

    marks[Student][subject] = mark; 
  }
}
