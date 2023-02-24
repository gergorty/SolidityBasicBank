// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.6;

contract DepositContract {
    mapping (address => uint) private deposits;
    uint public totalDeposits = 0;

    function deposit() public payable {   
      // TO DO
      deposits[msg.sender] += msg.value;
      totalDeposits += msg.value;
    }

    function withdraw(address x) public payable{
      // TO DO
      require(deposits[x] >= 0, "No Funds");
      uint amount = deposits[x];
      payable(x).transfer(amount);
      deposits[x] -= amount;
      totalDeposits -= amount;


      // (bool sent,) = msg.sender.call{value: amount} ("sent");
      // require(sent, "Failed to send");
    }

    function getTotalDeposits() public view returns (uint) {
      // TO DO
        return totalDeposits;
    }
}