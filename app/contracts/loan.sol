pragma solidity ^0.5.0;

import "./Ownable.sol";
import "./Oraclize.sol";



contract Loan is Ownable, OraclizeI {
    struct Rational {
        uint256 numerator;
        uint256 denominator;
    }

    address lender;
    address borrower;
    
    mapping(address => uint256) internal balances;
    
    Rational public interestRate;

    uint256 public dueDate;
    uint256 paymentPeriod;

    uint256 public remainingBalance;
    uint256 public minimumPayment;

  
    constructor(
        address _lender,
        address _borrower,
        uint256 interestRateNumerator,
        uint256 interestRateDenominator,
        uint256 _paymentPeriod,
        uint256 _minimumPayment,
        uint256 principal
        
    )
        public
    {  
        lender = _lender;
        borrower = _borrower;
        interestRate = Rational(interestRateNumerator, interestRateDenominator);
        paymentPeriod = _paymentPeriod;
        minimumPayment = _minimumPayment;
        remainingBalance = principal;
        dueDate = now + paymentPeriod;
        
    }
    
      modifier onlyBorrower() {
        require(msg.sender == borrower);
        _;
    }

    function multiply(uint256 x, Rational memory r) internal pure returns (uint256) {
        return  x * r.numerator / r.denominator;
    }

    
        function calculateComponents(uint256 amount)
        internal
        view
        returns (uint256 interest, uint256 principal)
    {
        interest = multiply(remainingBalance, interestRate);
        require(amount >= interest);
        principal = amount - interest;
        return (interest, principal);
    }
    
    //1 wei, not 1 ether
    
    function makePayment(address loanOriginator) public onlyBorrower payable returns(bool){
        require(now <= dueDate);
        require(msg.value >= minimumPayment);

        // require(principal <= remainingBalance);
        require(msg.value >= minimumPayment);
        
        balances[msg.sender] -= msg.value;
        remainingBalance = remainingBalance - msg.value;
        dueDate += paymentPeriod;
        balances[loanOriginator] += msg.value;
        
        return true;
    }
    
       /// @notice Get balance
    /// @return The balance of the user
    // A SPECIAL KEYWORD prevents function from editing state variables;
    // allows function to run locally/off blockchain
    function balance() public view returns (uint) {
        return balances[msg.sender];
        
    }
    
    
 


    // function withdraw(address payable lender) public {
    //     lender.transfer(address(this).balance);
    // }


    // function returnCollateral() public {
    //     require(remainingBalance == 0);

    //     uint256 amount = token.balanceOf(this);
    //     require(token.transfer(borrower, amount));
    // }
}