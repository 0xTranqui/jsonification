// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {ThemeRegistry} from "../src/ThemeRegistry.sol";

contract DeployCore is Script {

    function setUp() public {}

    function run() public {
        

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        new ThemeRegistry();

        vm.stopBroadcast();
    }
}


// ======= DEPLOY SCRIPTS =====

// source .env
// forge script script/ThemeRegistry.s.sol:DeployCore --rpc-url $GOERLI_RPC_URL --broadcast --verify  -vvvv
