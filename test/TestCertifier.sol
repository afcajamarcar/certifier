pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Certifier.sol";

contract TestCertifier {

    Certifier certifier;

    function beforeEach() public{
        certifier = Certifier(DeployedAddresses.Certifier());
    }

    function testContractInstance() public {
        Assert.equal(certifier.owner(), msg.sender, "You are not the expected owner");
    }

    function testAddCourse() public {
        bytes32 name = "Solidity course";
        string memory code = "SC";
        uint cost = 3;
        uint duration = 9;
        uint threshold = 80;
        string[3] memory codes = ["abc","bcd","cde"];
//        Assert.lengthEqual(code,name,cost,duration,threshold,codes);
    }
}