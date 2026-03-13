// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {CounterFactory} from "../src/CounterFactory.sol";

contract CounterFactoryTest is Test {
    CounterFactory public factory;

    function setUp() public {
        factory = new CounterFactory();
    }

    function test_CreateContract() public {
        factory.createCounter(20);
    }

    // function testFuzz_SetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
