// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import {Counter} from "./Counter.sol";

contract CounterFactory {
    address private owner;

    event CounterDeployed(address indexed contractAddress);

    function _isOwner() internal view {
        require(msg.sender == owner);
    }

    modifier onlyOwner() {
        _isOwner();
        _;
    }

    function createCounter(uint256 number) public {
        Counter counter = new Counter();
        counter.setNumber(number);

        emit CounterDeployed(address(counter));
    }
}
