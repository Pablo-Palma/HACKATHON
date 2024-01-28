// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import "../src/Integrate.sol";

contract Deploy is Script {

    function run() public {

        uint256 privKey = vm.envUint("PRIVATE_KEY_PROD");

        vm.startBroadcast(vm.addr(privKey));

        runDeploy();

    }

    function runDeploy() public {

        Integrate integrate = new Integrate();

        console.log("Integrate:", address(integrate));

    }
}
