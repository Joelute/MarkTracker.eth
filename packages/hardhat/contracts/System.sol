pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract System {

  string[8] subjects = [
    "English",
    "Math",
    "ComputerScience",
    "Chemistry",
    "Physics",
    "Music",
    "Art",
    "Gym"
  ];

  mapping(address => mapping(string => uint)) Marks;


  address public student;

  function Select_Student(address _student) public {
    student = _student;
  }

  uint public English = 100;
  uint public Math = 100;
  uint public ComputerScience = 99;
  uint public Chemistry = 74;
  uint public Physics = 56;
  uint public Music = 23;
  uint public Art = 85;
  uint public Gym = 84;

  function _toLower(string memory str) internal pure returns (string memory) {
    bytes memory bStr = bytes(str);
    bytes memory bLower = new bytes(bStr.length);
    for (uint i = 0; i < bStr.length; i++) {
        // Uppercase character...
        if ((uint8(bStr[i]) >= 65) && (uint8(bStr[i]) <= 90)) {
            // So we add 32 to make it lowercase
            bLower[i] = bytes1(uint8(bStr[i]) + 32);
        } else {
            bLower[i] = bStr[i];
        }
    }
    return string(bLower);
  }

  function updateMark() public {
    English = Marks[student][subjects[0]];
    Math = Marks[student][subjects[1]];
    ComputerScience = Marks[student][subjects[2]];
    Chemistry = Marks[student][subjects[3]];
    Physics = Marks[student][subjects[4]];
    Music = Marks[student][subjects[5]];
    Art = Marks[student][subjects[6]];
    Gym = Marks[student][subjects[7]];
  }

  // constructor() {
  //   updateMark();
  // }
}

contract TeacherPortal is System {

  address Teacher = 0x23Ab3aaA7EbB95C70079aaD320b25a5506b2657f;
  address public Student;

  function Select_student(address _student) public {
    Student = _student;
  }

  function edit_mark(uint mark, string memory subject) public {
    require (mark >= 0 && mark <= 100, "Invalid mark"); 
    
    for (uint i = 0; i <subjects.length; i++) {
      if (keccak256(abi.encodePacked(_toLower(subjects[i]))) == keccak256(abi.encodePacked(_toLower(subject)))) {
        Marks[Student][subjects[i]] = mark;
        return;
      }
    }
    require( true, "Invalid subject");
  }
}

contract StudentPortal is System {
  uint public averageMark = 100;
  address public Student;

  constructor() {
    updateAverageMark();
  }

  function Select_student(address _student) public {
    Student = _student;
  }

  function marks(string memory subject) public view returns (uint) {
    for (uint i = 0; i <subjects.length; i++) {
      if (keccak256(abi.encodePacked(_toLower(subjects[i]))) == keccak256(abi.encodePacked(_toLower(subject)))) {
        return Marks[Student][subjects[i]];
      }
    }return 0;
  }

  function updateAverageMark() public {
    uint sum = 0;
    for (uint i=0;i<subjects.length;i++) {
      sum += Marks[Student][subjects[i]];
    }   
    averageMark = (sum/8);
  }
}