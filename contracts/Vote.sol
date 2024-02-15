//SPDX-Licencse-Identifier :UNLICENSED
pragma solidity ^0.8.9;
import "hardhat/console.sol";

contract Vote {
    address public owner; 
    event VoteCasted(address voter, uint256 candidateIndex);
    event NewCandidate(string _name);


    struct Candidate {
        string name;
        uint256 voteCount;
    }
    Candidate[] public candidates;

    function newcandidate(string memory _name) external  {
    candidates.push(Candidate(_name, 0));
    console.log(
        "testtrigger"
    );


        emit NewCandidate(_name);
        
    }
   // mapping (uint => string) ;
//ajout système de sécurité à faire next
    function castVote (uint256 _candidateNum) private {

        require(_candidateNum < candidates.length, "Invalid candidate index");
        candidates[_candidateNum].voteCount ++;
        emit VoteCasted(msg.sender, _candidateNum);
    }    

    function displayResult() public view  returns(Candidate[] memory)   {
        return candidates;
    } 
}