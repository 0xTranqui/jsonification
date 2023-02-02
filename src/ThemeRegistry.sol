// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

// import {ReentrancyGuard} from "openzeppelin-contracts/security/ReentrancyGuard.sol";
// import {BytecodeStorage} from "./utils/BytecodeStorage.sol";
// import {ThemeJsonBuilder} from "./utils/ThemeJsonBuilder.sol";
import {IThemeAccessControl} from "./interfaces/IThemeAccessControl.sol";

/**
 * @title ThemeRegistry
 * @notice Facilitates access control protected basic onchain data storage for theming content
 * @notice not audited use at own risk
 * @author Max Bochman ---Ⓟ
 *
 */
contract ThemeRegistry2 {

    // // ||||||||||||||||||||||||||||||||
    // // ||| ERRORS |||||||||||||||||||||
    // // ||||||||||||||||||||||||||||||||     

    // error No_Access();

    // // ||||||||||||||||||||||||||||||||
    // // ||| EVENTS |||||||||||||||||||||
    // // ||||||||||||||||||||||||||||||||

    // event ThemeIndexInit(
    //     address sender,
    //     address accessControl,
    //     bytes accessControlInit,
    //     string themeUri,
    //     uint256 themeIndex,
    //     address addressDataContract
    // );

    // event ThemeIndexUpdated(
    //     address sender,
    //     string themeUri,
    //     uint256 themeIndex,
    //     address addressDataContract
    // );

    // // ||||||||||||||||||||||||||||||||
    // // ||| STORAGE ||||||||||||||||||||
    // // ||||||||||||||||||||||||||||||||     


    // struct Configuration {
    //     string background;
    //     string primaryHex;
    //     string secondaryHex;
    //     string tertiaryHex;
    //     string highlightHex;        
    //     string navigation;
    //     string heading;
    //     string subHeading;
    //     string body;
    //     string caption;        
    //     string colorHex;
    //     uint256 spread;        
    //     uint256 mainRadius;
    //     uint256 buttonRadius;        
    // }

    // mapping(uint256 => Configuration) public themeIndexInfo;
    // mapping(uint256 => address) public themeDataAccessControl;

    // uint256 themeIndex = 0;

    // // // ||||||||||||||||||||||||||||||||
    // // // ||| WRITE FUNCTIONS ||||||||||||
    // // // ||||||||||||||||||||||||||||||||

    // function initializeThemeIndex(
    //     Configuration calldata themeConfig,
    //     address accessControl, 
    //     bytes memory accessControlInit
    // ) external {

    //     ++themeIndex;

    //     uint256 currentIndex;

    //     IThemeAccessControl(accessControl).initializeWithData(currentIndex, accessControlInit);        

    //     themeDataAccessControl[currentIndex] = accessControl;

    //     themeIndexInfo[currentIndex] = themeConfig;

    //     // emit ThemeIndexInit({
    //     //     sender: msg.sender,
    //     //     accessControl: accessControl,
    //     //     accessControlInit: accessControlInit,
    //     //     themeUri: themeUri,
    //     //     themeIndex: currentThemeIndex,
    //     //     addressDataContract: dataContract
    //     // });

    //     // currentThemeIndex++;
    // } 

    // ||||||||||||||||||||||||||||||||
    // ||| VIEW FUNCTIONS |||||||||||||
    // ||||||||||||||||||||||||||||||||    

    // function themeIndexJSON(uint256 index) public view returns (string memory) {

    //     // Configuration memory config = themeIndexInfo[index];
    //     string memory background = themeIndexInfo[index].background;
    //     string memory primaryHex = themeIndexInfo[index].primaryHex;

    //     return ThemeJsonBuilder.createTheme({
    //         backgroundString: background,
    //         primaryHex: primaryHex
    //     });
    // }    

    // function updateThemeIndex(
    //     uint256 themeIndex, 
    //     string memory newThemeUri
    // ) external nonReentrant returns (address) {

    //     if (IThemeAccessControl(themeDataAccessControl[themeIndex]).getAccessLevel(themeIndex, msg.sender) < 1) {
    //         revert No_Access();
    //     }

    //     address dataContract = themeDataInfo[themeIndex];

    //     if (dataContract != address(0x0)) {
    //         BytecodeStorage.purgeBytecode(dataContract);
    //     }        

    //     themeDataInfo[themeIndex] = BytecodeStorage.writeToBytecode(
    //         abi.encode(newThemeUri)
    //     );        

    //     emit ThemeIndexUpdated({
    //         sender: msg.sender,
    //         themeUri: newThemeUri,
    //         themeIndex: themeIndex,
    //         addressDataContract: themeDataInfo[themeIndex]
    //     });

    //     return themeDataInfo[themeIndex];
    // } 

    // // ||||||||||||||||||||||||||||||||
    // // ||| VIEW FUNCTIONS |||||||||||||
    // // ||||||||||||||||||||||||||||||||    

    // function viewThemeURI(uint256 themeIndex) public view returns (string memory) {

    //     string memory themeUri = abi.decode(
    //         BytecodeStorage.readFromBytecode(themeDataInfo[themeIndex]),
    //         (string)
    //     );

    //     return themeUri;
    // }
}
