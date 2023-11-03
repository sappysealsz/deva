// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

// contract AccessMultiSig {
//     bytes32 public constant VOTER_ROLE = keccak256("VOTER_ROLE");
//     bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

//     uint256 private _numRequiredConfirmations;

//     struct Proposal {
//         bool isExist;
//         address creator;
//         bytes32 signatureId;
//         bytes data;
//         uint256 deadline;
//         bool completed;
//         uint256 confirmations;
//         mapping(address => bool) confirmed;
//     }

//     mapping(bytes32 => Proposal) private _proposals;

//     event ProposalCreated(
//         bytes32 indexed proposalId, address indexed creator, bytes32 indexed signatureId, bytes data, uint256 deadline
//     );
//     event ProposalConfirmed(bytes32 indexed proposalId, address indexed confirmer);
//     event ProposalCompleted(bytes32 indexed proposalId, address indexed executant);

//     error ProposalDoesNotExist();
//     error DeadlineIsExpired();
//     error AlreadyConfirmed();

//     constructor(uint256 numRequiredConfirmations, address[] memory voters) {
//         _numRequiredConfirmations = numRequiredConfirmations;

//         _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
//         for (uint256 i = 0; i < voters.length; i++) {
//             _setupRole(VOTER_ROLE, voters[i]);
//         }
//     }

//     modifier requireConfirmation(bytes32 proposalId) {
//         Proposal storage proposal = _proposals[proposalId];
//         require(proposal.isExist, "COMMSToken: Proposal does not exist");
//         require(msg.sig == bytes4(proposal.signatureId), "COMMSToken: Signature ID is not match");
//         require(proposal.deadline > block.timestamp, "COMMSToken: Deadline is expired");
//         require(proposal.confirmations >= _numRequiredConfirmations, "COMMSToken: Not enough confirmations");
//         require(!proposal.completed, "COMMSToken: Proposal is completed");
//         _;
//     }

//     function getNumRequiredConfirmations() external view returns (uint256) {
//         return _numRequiredConfirmations;
//     }

//     function setNumRequiredConfirmations(uint256 numRequiredConfirmations) external onlyRole(DEFAULT_ADMIN_ROLE) {
//         _numRequiredConfirmations = numRequiredConfirmations;
//     }

//     function getProposal(bytes32 proposalId)
//         external
//         view
//         returns (
//             bool isExist,
//             address creator,
//             bytes32 signatureId,
//             bytes memory data,
//             uint256 deadline,
//             bool completed,
//             uint256 confirmations
//         )
//     {
//         Proposal storage proposal = _proposals[proposalId];

//         isExist = proposal.isExist;
//         creator = proposal.creator;
//         signatureId = proposal.signatureId;
//         data = proposal.data;
//         deadline = proposal.deadline;
//         completed = proposal.completed;
//         confirmations = proposal.confirmations;
//     }

//     function createProposal(bytes memory signature, bytes memory data, uint256 deadline)
//         external
//         onlyRole(VOTER_ROLE)
//         returns (bytes32)
//     {
//         require(signature.length > 0, "COMMSToken: Signature is empty");
//         require(deadline > block.timestamp, "COMMSToken: Deadline must be greater than current time");

//         bytes32 signatureId = keccak256(abi.encodePacked(signature));
//         bytes32 proposalId = keccak256(abi.encodePacked(signatureId, data, deadline));
//         Proposal storage proposal = _proposals[proposalId];
//         require(!proposal.isExist, "COMMSToken: Proposal exists");

//         proposal.isExist = true;
//         proposal.creator = msg.sender;
//         proposal.signatureId = signatureId;
//         proposal.data = data;
//         proposal.deadline = deadline;

//         emit ProposalCreated(proposalId, msg.sender, signatureId, data, deadline);

//         return proposalId;
//     }

//     function confirmProposal(bytes32 proposalId) external onlyRole(VOTER_ROLE) {
//         Proposal storage proposal = _proposals[proposalId];

//         // require(proposal.isExist, "COMMSToken: Proposal does not exist");
//         // require(proposal.deadline > block.timestamp, "COMMSToken: Deadline is expired");
//         // require(!proposal.confirmed[msg.sender], "COMMSToken: Already confirmed");

//         proposal.confirmations += 1;
//         proposal.confirmed[msg.sender] = true;

//         emit ProposalConfirmed(proposalId, msg.sender);
//     }

//     // function mint(bytes32 proposalId) external onlyRole(VOTER_ROLE) requireConfirmation(proposalId) {
//     //     Proposal storage proposal = _proposals[proposalId];

//     //     proposal.completed = true;

//     //     (address account, uint256 amount) = abi.decode(proposal.data, (address, uint256));
//     //     _mint(account, amount);

//     //     emit ProposalCompleted(proposalId, msg.sender);
//     // }
// }
