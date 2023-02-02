// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import {DSTest} from "ds-test/test.sol";
import {Vm} from "forge-std/Vm.sol";
import {console} from "forge-std/console.sol";
import {console2} from "forge-std/console2.sol";
import {ThemeRegistry} from "../src/ThemeRegistry.sol";


contract ThemeRegistryTest is DSTest {

    ThemeRegistry themeRegistry;
    string backgroundString = "ipfs.io/ipfs/blahblah";
    string f = "#eb88ed"; 
    string g = "#eb88ed"; 
    string h = "#eb88ed"; 
    string i = "#eb88ed"; 
    string j = "#eb88ed"; 
    string k = "#eb88ed"; 
    string l = "#eb88ed"; 
    string m = "#eb88ed"; 
    string n = "#eb88ed"; 
    string o = "#eb88ed"; 

    struct Configuration1 {
        string background;
        string primaryHex;
        string secondaryHex;
        string tertiaryHex;
        string highlightHex;        
        string navigation;
        string heading;       
    }    

    function setUp() public {
        themeRegistry = new ThemeRegistry();
    }

    function test_init3() public {
        Configuration1 memory config;
        config.background = backgroundString;
        config.primaryHex = f;
        config.secondaryHex = f;
        config.tertiaryHex = f;
        config.highlightHex = f;
        config.navigation = f;
        config.heading = f;
        bytes memory chunk3 = abi.encode(config);
        bytes memory chunk4 = abi.encode(config);
        bytes memory combinedChunk2 = abi.encode(chunk3, chunk4);
        // console2.log("wtf are the bytes", combinedChunk2);

        themeRegistry.initializeWithData(combinedChunk2);
        themeRegistry.viewThemeData(1);
        console.log(themeRegistry.viewThemeData(1));
        themeRegistry.viewThemeData(1);

    }
}