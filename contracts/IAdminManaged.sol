// SPDX-License-Identifier: MIT 
interface IAdminManaged {
    function addAdmin(address admin) external;
    function removeAdmin(address admin) external;
    function isAdmin(address admin) external view returns (bool);
}