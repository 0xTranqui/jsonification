// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {Strings} from "openzeppelin-contracts/utils/Strings.sol";
import {Base64} from "openzeppelin-contracts/utils/Base64.sol";
import {BytecodeStorage} from "./BytecodeStorage.sol";

/// NFT metadata library for rendering metadata associated with editions
library ThemeRenderer {

    struct Configuration1 {
        string background;
        string primaryHex;
        string secondaryHex;
        string tertiaryHex;
        string highlightHex;        
        string navigation;
        string heading;       
    }

    struct Configuration2 {
        string subHeading;
        string body;
        string caption;        
        string colorHex;
        string spread;        
        string mainRadius;
        string buttonRadius; 
    }

    function encodeThemeJSON(address dataContract) internal view returns (string memory) {

        // cache two strings that will be added two after decoding + formatting data
        string memory pt1;
        string memory pt2;

        // fetch bytes from data contract + decode it into 2 parts
        (bytes memory data1, bytes memory data2) = abi.decode(BytecodeStorage.readFromBytecode(dataContract), (bytes, bytes));

        /* 
            SCOPE ONE STARTS BELOW 
        */
        {
            (Configuration1 memory config1) = abi.decode(data1, (Configuration1));
            pt1 = string(
                abi.encodePacked(
                    '{"background": "',
                    config1.background,
                    '", "colors": {"primary": "',
                    config1.primaryHex,
                    '", "secondary": "',
                    config1.secondaryHex,
                    '", "tertiary": "',
                    config1.tertiaryHex,
                    '", "highlight": "',
                    config1.highlightHex,
                    '"}, "fonts": {"naviagtion": "',
                    config1.navigation,
                    '", "heading": "',
                    config1.heading                   
                )
            );            
        }
        /* 
            SCOPE TWO STARTS BELOW 
        */
        {
            (Configuration2 memory config2) = abi.decode(data2, (Configuration2));               
            pt2 = string(
                abi.encodePacked(
                    '", "subHeading": "',
                    config2.subHeading,                      
                    '", "body": "',
                    config2.body,
                    '". "caption": "',
                    config2.caption,
                    '"}, "dropShadow": {"color": "',
                    config2.colorHex,
                    '", "spread": "',
                    config2.spread,
                    '"}, "cornerRadius": {"mainRadius": "',
                    config2.mainRadius,
                    "px"'", "buttonRadius": "',
                    config2.buttonRadius,
                    "px"'"}}'                                       
                )
            );            
        }
        return 
            string(
                encodeMetadataJSON(
                    abi.encodePacked(string.concat(pt1, pt2)
                )
            )
        );   
    }

    /// Encodes the argument json bytes into base64-data uri format
    /// @param json Raw json to base64 and turn into a data-uri
    function encodeMetadataJSON(bytes memory json)
        internal
        pure
        returns (string memory)
    {
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(json)
                )
            );
    }
}