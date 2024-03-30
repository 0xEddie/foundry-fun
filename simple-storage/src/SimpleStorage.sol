// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// [optional] In a terminal run `anvil` to start a local fork
// To simulate the deployment: in a new terminal run
// forge script script/DeploySimpleStorage.s.sol
// To actually deploy the contract on local testnet: in a new terminal run
// forge script script/DeploySimpleStorage.s.sol --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;

    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
