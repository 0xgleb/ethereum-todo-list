// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract TodoList {
    // "state variable". it's written to the blockchain
    // the keyword "public" creates a getter function for the variable
    uint public taskCount = 0;

    // struct is how you define custom data types
    struct Task {
        uint id;
        string content;
        bool isDone;
    }

    // "mapping" is like an associative array or Map in Haskell
    mapping(uint => Task) public tasks;

    constructor() public {
        createTask("Write your first Ethereum smart contract");
    }

    function createTask(string memory _content) public {
        taskCount++;

        tasks[taskCount] = Task(taskCount, _content, false);
    }
}
