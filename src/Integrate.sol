// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title Integrate
 * @dev Feedback Protocol
 */
contract Integrate {

	enum FeedbackType { ONCHAIN, OFFCHAIN }
	enum FeedbackStatus { ACTIVE, CANCELED, RESOLVED }

	struct Feedback {
		FeedbackType feedbackType;
		FeedbackStatus status;
		uint8 rating;
		address sender;
		address wallet_out;
		address wallet_in;
		uint256 timestamp;
		uint256 tipsBalance;
		string identifier;
		string metadataHash;
	}

	address owner;

	Feedback[] private feedbacks;

	mapping (address => uint256[]) private feedbacksByWallet;

	mapping(address => mapping(uint256 => uint256)) private tippersBalances;

	event FeedbackPublished(
		address indexed wallet_out,
		address indexed wallet_in,
		uint256 feedbackId,
		uint8 rating
	);

	error InvalidFeedbackType();
	error InvalidRating();
	error EmptyIdentifier();

	constructor() {
		owner = msg.sender;
	}

	/**
	 * @dev Publishes a new feedback
	 */
	function publishFeedback(
		FeedbackType feedbackType,
		address wallet_out,
		address wallet_in,
		uint8 rating,
		string calldata identifier,
		string calldata metadataHash) public returns (uint256) {

		if (feedbackType != FeedbackType.ONCHAIN && feedbackType != FeedbackType.OFFCHAIN) {
			revert InvalidFeedbackType();
		}
		if(rating < 1 || rating > 5) {
			revert InvalidRating();
		}
		if(bytes(identifier).length == 0) {
			revert EmptyIdentifier();
		}
		require(wallet_out != wallet_in, "Wallets must be different");
		require(msg.sender == wallet_out || msg.sender == wallet_in, "Sender must be one of the wallets");

		uint256 feedbackId = feedbacks.length;

		Feedback memory feedback = Feedback({
			feedbackType: feedbackType,
			status: FeedbackStatus.ACTIVE,
			rating: rating,
			sender: msg.sender,
			wallet_out: wallet_out,
			wallet_in: wallet_in,
			timestamp: block.timestamp,
			tipsBalance: 0,
			identifier: identifier,
			metadataHash: metadataHash
		});

		// Array of feedbacks
		feedbacks.push(feedback);

		// Maps feedbacks to wallets
		feedbacksByWallet[wallet_out].push(feedbackId);
		feedbacksByWallet[wallet_in].push(feedbackId);

		emit FeedbackPublished(wallet_out, wallet_in, feedbackId, rating);

		return feedbackId;
	}

	/**
	 * @dev Gives a tip to a feedback
	 */
	function tipFeedback(uint256 feedbackId) public payable {
		Feedback storage feedback = feedbacks[feedbackId];
		tippersBalances[msg.sender][feedbackId] += msg.value;
		feedback.tipsBalance += msg.value;
	}

	function getFeedbacks() public view returns (Feedback[] memory) {
		return feedbacks;
	}

	function getFeedbackById(uint256 feedbackId) public view returns (Feedback memory) {
		return feedbacks[feedbackId];
	}

	function getFeedbacksByWallet(address wallet) public view returns (uint256[] memory) {
		return feedbacksByWallet[wallet];
	}

	/*
	 * @dev Cancels a feedback and sends the funds back to the sender
	 */
	function cancelFeedback(uint256 feedbackId) public {
		Feedback storage feedback = feedbacks[feedbackId];

		require(feedback.sender == msg.sender, "Only the sender can cancel the feedback");
		require(feedback.status == FeedbackStatus.ACTIVE, "Feedback must be active");

		feedback.status = FeedbackStatus.CANCELED;
		feedback.tipsBalance = 0;
		payable(feedback.sender).transfer(feedback.tipsBalance);
	}
}