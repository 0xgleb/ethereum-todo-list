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
        bool completed;
    }

    // "mapping" is like an associative array or Map in Haskell
    mapping(uint => Task) public tasks;

    constructor() public {
        createTask("Write your first Ethereum smart contract");
    }

    // Create an event so that consumers can subscribe to it
    event TaskCreated(uint id, string content, bool completed);

    function createTask(string memory _content) public {
        taskCount++;

        tasks[taskCount] = Task(taskCount, _content, false);

        emit TaskCreated(taskCount, _content, false);
    }

    event TaskCompleted(uint id, string content, bool completed);

    function completeTask(uint id) public {
        Task memory oldTask = tasks[id];

        tasks[id] = Task(id, oldTask.content, true);

        emit TaskCompleted(id, oldTask.content, true);
    }
}
