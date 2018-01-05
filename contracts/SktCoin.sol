pragma solidity ^0.4.2;

import "./Ownable.sol";
import "./StandardToken.sol";
import "./math/SafeMath.sol";

/* SafeKeet Contract */
contract SktCoin is StandardToken, Ownable {
    using SafeMath for uint256;

    /* Overriding some ERC20 variables */
    string public constant name = "SafeKeetToken";
    string public constant symbol = "SKT";
    uint256 public constant decimals = 8;
    uint256 public constant MAX_TOKEN_AMOUNT = 1000000000 * 10 ** decimals;
    uint256 public constant FROZEN_TOKEN_AMOUNT = 100000000 * 10 ** decimals;
    uint256 public constant SALE_TOKEN_AMOUNT = 200000000 * 10 ** decimals;

    // END ICO TIMESTAMP
    uint public constant END_ICO_TIMESTAMP = 1519844401; // 28/02/2018 @ 20:00:01
    uint public constant DEFROST_TIMESTAMP = 1535479201; // 28/08/2018 @ 20:00:01

    function SktCoin() public {
        owner = msg.sender;
        totalSupply = MAX_TOKEN_AMOUNT;
        balances[owner] = MAX_TOKEN_AMOUNT;
    }

    /**
     * @dev Throws if ICO is not finish.
     */
    modifier canTransfert() {
        require(now >= END_ICO_TIMESTAMP);
        _;
    }

    /**
     * @dev transfer token to a specified address if ICO is finish.
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _to, uint256 _value) public canTransfert returns (bool) {
        require(_to != address(0));
        require(_value <= balances[owner]);

        // SafeMath.sub will throw if there is not enough balance.
        balances[owner] = balances[owner].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(owner, _to, _value);

        return true;
    }
}