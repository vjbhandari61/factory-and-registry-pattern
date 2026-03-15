// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract CounterRegistry {
    address private owner;

    mapping(bytes32 => address) internal deployedContracts;

    event ContractRegistered(bytes32 id, address contractAddress);

    function _isOwner() internal view {
        require(msg.sender == owner, "Error");
    }

    modifier onlyOwner() {
        _isOwner();
        _;
    }

    function getIdByName(string memory _contractName) public view returns(bytes32){
        return keccak256(abi.encodePacked(_contractName));
    }

    function addNewDeployedAddress(string memory _contractName, address _newContract) external onlyOwner {
        bytes32 _id = getIdByName(_contractName);
        require(deployedContracts[_id] != address(0), "CounterRegistry: Address Already Exists!");

        deployedContracts[_id] = _newContract;
        emit ContractRegistered(_id, _newContract);
    }

    function getDeployedContract(string memory _contractName) external view returns(address) {
        bytes32 _id = getIdByName(_contractName);
        
        return deployedContracts[_id]; 
    }
}
