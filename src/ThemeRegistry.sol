// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

// import {ReentrancyGuard} from "openzeppelin-contracts/security/ReentrancyGuard.sol";
// import {BytecodeStorage} from "./utils/BytecodeStorage.sol";
import {ThemeRenderer} from "./utils/ThemeRenderer.sol";
import {IThemeAccessControl} from "./interfaces/IThemeAccessControl.sol";
import {console2} from "forge-std/console2.sol";
import {BytecodeStorage} from "./utils/BytecodeStorage.sol";

/**
 * @title ThemeRegistry
 * @notice Facilitates access control protected basic onchain data storage for theming content
 * @notice not audited use at own risk
 * @author Max Bochman ---Ⓟ
 *
 */
contract ThemeRegistry {

    // ||||||||||||||||||||||||||||||||
    // ||| ERRORS |||||||||||||||||||||
    // ||||||||||||||||||||||||||||||||

    error Index_Doesnt_Exist();
    error No_Admin_Access();

    // ||||||||||||||||||||||||||||||||
    // ||| STORAGE ||||||||||||||||||||
    // ||||||||||||||||||||||||||||||||

    mapping(uint256 => address) public themeIndexInfo;
    mapping(uint256 => mapping(address => uint256)) public themeDataAccessControl;
    uint256 public themeIndex = 0;

    // ||||||||||||||||||||||||||||||||
    // ||| WRITE FUNCTIONS ||||||||||||
    // ||||||||||||||||||||||||||||||||

    function initializeWithData(bytes memory data) external {

        ++themeIndex;

        themeIndexInfo[themeIndex] = BytecodeStorage.writeToBytecode(data);
        themeDataAccessControl[themeIndex][msg.sender] = 1;
    }

    function setThemeData(uint256 index, bytes memory data) external {
        if (index > themeIndex) {
            revert Index_Doesnt_Exist();
        }
        if (themeDataAccessControl[index][msg.sender] != 1) {
            revert No_Admin_Access();
        }
        themeIndexInfo[themeIndex] = BytecodeStorage.writeToBytecode(data);
    }

    function setAdmin(uint256 index, address newAdmin) external {
        if (index > themeIndex) {
            revert Index_Doesnt_Exist();
        }        
        if (themeDataAccessControl[index][msg.sender] != 1) {
            revert No_Admin_Access();
        }
        themeDataAccessControl[index][newAdmin] == 1;
    }

    function viewThemeData(uint256 index) view external returns (string memory) {   
        return ThemeRenderer.encodeThemeJSON(themeIndexInfo[index]);        
    }

    function viewAdminStatus(uint256 index, address user) view external returns (bool) {       
        if (themeDataAccessControl[index][user] == 1) {
            return true;
        }
        return false;
    }
}
