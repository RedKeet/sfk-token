pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SktCoin.sol";

contract TestSktcoin {

    uint256 public constant MAX_TOKEN = 100000000000000000;

    function testInitialBalanceUsingDeployedContract() public {
        SktCoin meta = SktCoin(DeployedAddresses.SktCoin());

        Assert.equal(meta.balanceOf(msg.sender), MAX_TOKEN, "Owner should have 100000000000000000 microSktCoin initially");
    }
}