// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {Integrate} from "../src/Integrate.sol";

contract IntegrateTest is Test {

	Integrate integrate;
	address alice;

    function setUp() public virtual {
        // setup utils
        integrate = new Integrate();

        alice = makeAddr("alice");
    }

	function testAddFeedback() public {

		vm.startPrank(alice);

		integrate.publishFeedback(
            Integrate.FeedbackType.ONCHAIN,
            alice,
            0x3853C11A07f61e696FF40a871E22B6864a0Dc55a,
            3,
            "0x8f869c8c5a892e68ad082db06dc285412a57124588c133dd4f0d8d035aeb1c54",
            ""
        );

		Integrate.Feedback[] memory feedbacks = integrate.getFeedbacks();

		console.log("length", feedbacks.length);
		console.log("identifier", feedbacks[0].identifier);
	}
}
