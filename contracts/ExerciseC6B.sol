pragma solidity >=0.5.0 <0.7.0;

// It's important to avoid vulnerabilities due to numeric overflow bugs
// OpenZeppelin's SafeMath library, when used correctly, protects agains such bugs
// More info: https://www.nccgroup.trust/us/about-us/newsroom-and-events/blog/2018/november/smart-contract-insecurity-bad-arithmetic/

import "../node_modules/@openzeppelin/contracts/math/SafeMath.sol";


contract ExerciseC6B {
    using SafeMath for uint256; // Allow SafeMath functions to be called for all uint256 types (similar to "prototype" in Javascript)

    /********************************************************************************************/
    /*                                       DATA VARIABLES                                     */
    /********************************************************************************************/

    string public name;
    string public symbol;
    uint8 public decimals;

    mapping(address => uint256) internal balances;
    uint256 internal totalSupply_;
    uint256 constant WEI_PER_TOKEN = 1000000000;

    address private contractOwner;                  // Account used to deploy contract

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Buy(address indexed account, uint256 tokens);

    constructor() public {
        contractOwner = msg.sender;
    }

    // fallback() public payable {
    //     buy(msg.sender);
    // }

    /********************************************************************************************/
    /*                                       FUNCTION MODIFIERS                                 */
    /********************************************************************************************/

    // Modifiers help avoid duplication of code. They are typically used to validate something
    // before a function is allowed to be executed.

    /**
    * @dev Modifier that requires the "ContractOwner" account to be the function caller
    */
    modifier requireContractOwner() {
        require(msg.sender == contractOwner, "Caller is not contract owner");
        _;
    }

    /********************************************************************************************/
    /*                                     SMART CONTRACT FUNCTIONS                             */
    /********************************************************************************************/

    /**
    * @dev Total number of tokens in existence
    */
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    /**
    * @dev Transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_value <= balances[msg.sender], "");
        require(_to != address(0), "");

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param _owner The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function buy(address account) public payable {
        require(msg.value >= WEI_PER_TOKEN, "");

        uint256 tokens = msg.value.div(WEI_PER_TOKEN);
        balances[account] = balances[account].add(tokens);
        emit Buy(account, tokens);
    }
}

