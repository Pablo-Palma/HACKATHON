// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "../src/Integrate.sol";

contract AddFeedbacks is Script {

    function run() public {

        uint256 privKey = vm.envUint("PRIVATE_KEY_PROD");

        vm.startBroadcast(privKey);

        runDeploy();

    }

    function runDeploy() public {

        Integrate integrate = Integrate(0x3853C11A07f61e696FF40a871E22B6864a0Dc55a);

        integrate.publishFeedback(
            Integrate.FeedbackType.ONCHAIN,
            0x5ba53D4573C5036aBa93c66F461884F13D91531C,
            0x3853C11A07f61e696FF40a871E22B6864a0Dc55a,
            3,
            "0x8f869c8c5a892e68ad082db06dc285412a57124588c133dd4f0d8d035aeb1c54",
            ""
        );
    }
}
