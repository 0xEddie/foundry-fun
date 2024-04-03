// // SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
// import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    uint256 number = 1;

    function setUp() external {
        number = 2;
    }

    function testDemo() public {
        console.log("number: ", number);
        console.log("Hewwwo!");
        assertEq(number, 2);
    }
}
