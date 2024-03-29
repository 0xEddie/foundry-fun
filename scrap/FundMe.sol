// Get funds from users
// Withdraw funds
// Set minimum USD deposit value
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from './PriceConverter.sol';

contract FundMe {
    using PriceConverter for uint256;

    uint16 funderIndex;
    address funder;

    uint256 public constant MINIMUM_USD = 5 * 1e18;
    address[] public funders;
    mapping(address funders => uint256 amountFunded) public fundingByAddress;

    address public immutable i_owner;
    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        // Allow users to send $
        // Have a minimum USD sent
        // 1. How do we send ETH to this contract? >> make function `payable`
        require(msg.value.getConversionRate() > MINIMUM_USD, "didn't send enough ETH");
        funders.push(msg.sender);
        fundingByAddress[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        // loop through funders, set their funding amounts to zero
        for(funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            funder = funders[funderIndex];
            fundingByAddress[funder] = 0;
        }
        // reset the funders array
        funders = new address[](0);

        // withdraw funds
        // transfer - 2300 gas, throws error
        // payable(msg.sender).transfer(address(this).balance);

        // send - 2300 gas, returns bool
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require (sendSuccess, "unsuccessful send");

        // call - forward all gas or set gas, returns bool **recommended**
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require (callSuccess, "unsuccessful call");
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner, "Must be i_owner.");
        _;
    }

    receive() external payable {fund();}
    fallback() external payable {fund();}
}