// SPDX-License-Identifier: MIT 
interface IKeyRegistry {

    struct Key {
        uint16 keyType;
        bytes value;
        string purpose;
        uint256 validFrom;
        uint256 validTill;
    }

    function registerKey(Key memory key) external;

    function revokeKey(bytes32 keyId, uint256 validTill) external;

    event KeyRegistered(bytes32 keyId, Key key);

    event KeyRevoked(bytes32 keyId);

}