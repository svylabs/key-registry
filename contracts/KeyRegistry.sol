// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "./IKeyRegistry.sol";
import "./AdminManaged.sol";

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract VerifiableKeyRegistry is IKeyRegistry, AdminManaged {

    string public ownerDomain;

    mapping(bytes32 => Key) public keys;

    constructor(string memory _ownerDomain) {
        ownerDomain = _ownerDomain;
    }

    function registerKey(Key memory key) public onlyAdmin {
        bytes32 keyId = keccak256(key.value);
        require(keys[keyId].validFrom !=0, "Key already exists");
        if (key.validFrom < block.timestamp) {
            key.validFrom = block.timestamp;
        }
        keys[keyId] = key;
        emit KeyRegistered(keyId, key);
    }

    function revokeKey(bytes32 keyId, uint256 validTill) public onlyAdmin {
        if (validTill == 0) {
            validTill = block.timestamp;
        }
        keys[keyId].validTill = validTill;
        emit KeyRevoked(keyId);
    }

    function getKey(bytes32 keyId) public view returns (Key memory) {
        return keys[keyId];
    }

}