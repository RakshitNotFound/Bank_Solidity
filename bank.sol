

//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Bank{

    address public accHolder;
    uint256 balance = 0;

    constructor(){
        accHolder = msg.sender;
    }

    function Deposit() public payable{
        require(msg.value > 0, "Deposit amount should be greater than 0.");
        require(msg.sender == accHolder, "You are not the account owner.");
        balance =  balance + msg.value;
    }

    function WithDraw() public payable{
        require(balance > 0, "You dont have enough balance.");
        require(msg.sender == accHolder, "You are not the account owner.");
        payable(msg.sender).transfer(msg.value);
        balance = balance - msg.value;
    }

    function ShowBalance() public view returns(uint) {
         require(msg.sender == accHolder, "You are not the account owner.");
         return balance;
    }
}

