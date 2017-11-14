pragma solidity ^0.4.8;

contract UserCrud {

  mapping (address => uint) userBalances;

  // make these private because they're related
  mapping(address => UserStruct) private userStructs;
  address[] private userIndex;

  struct UserStruct {
    bytes32 userEmail;
    uint userAge;
    uint index;
  }

  function isUser(address userAddress) public constant returns(bool isIndeed) {
    if(userStructs[userAddress].index > 0) {
      return true;
    } else {
      return false;
    }
  }

  function insertUser(address userAddress, bytes32 userEmail, uint userAge) public returns (bool success) {
    // add validation with msg.sender instead
    userStructs[userAddress].userEmail = userEmail;
    userStructs[userAddress].userAge = userAge;
    userStructs[userAddress].index = userIndex.push(userAddress)-1;
    return true;
  }

  function getUser(address userAddress) public constant returns(bytes32 userEmail, uint userAge) {
    return(
      userStructs[userAddress].userEmail,
      userStructs[userAddress].userAge
    );
  }
}
