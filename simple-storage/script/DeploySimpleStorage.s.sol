// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

// [optional] In a terminal run `anvil` to start a local fork
// To simulate the deployment: in a new terminal run
// forge script script/DeploySimpleStorage.s.sol
// To actually deploy the contract on local testnet: in a new terminal run
// forge script script/DeploySimpleStorage.s.sol --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

import {Script, console} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function setUp() public {}

    function run() public returns (SimpleStorage) {
        vm.startBroadcast();
        SimpleStorage simpleStorage = new SimpleStorage();
        // console.log("Deployed: " + simpleStorage.address);
        return simpleStorage;

        // vm.stopBroadcast();
    }
}
