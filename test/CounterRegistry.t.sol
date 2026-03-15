// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {CounterRegistry} from "../src/registry-pattern/CounterRegistry.sol";

contract CounterRegistryTest is Test {
    CounterRegistry public registry;

    function setUp() public {
        registry = new CounterRegistry();
    }

    function test_AddNewDeployedAddress() public {
        registry.addNewDeployedAddress("My Contract", vm.addr(1));
        assertEq(registry.getDeployedContract("My Contract"), vm.addr(1));
    }

    // function testFuzz_SetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }

    // function testFuzz_IncrementNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     counter.increment();

    //     assertEq(counter.number(), x + 1);
    // }
}
