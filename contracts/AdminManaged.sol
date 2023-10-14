// SPDX-License-Identifier: MIT 
import "./IAdminManaged.sol";

abstract contract AdminManaged is IAdminManaged {

    mapping(address => bool) public admins;

    modifier onlyAdmin() {
        require(admins[msg.sender] == true, "You are not an admin");
        _;
    }

    function addAdmin(address admin) public onlyAdmin {
        admins[admin] = true;
    }

    function removeAdmin(address admin) public onlyAdmin {
        admins[admin] = false;
    }

    function isAdmin(address admin) public view returns (bool) {
        return admins[admin];
    }

}