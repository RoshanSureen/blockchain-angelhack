pragma solidity ^0.4.4;

contract Merchant {

  struct person {
    bytes32 bankaccountNumber;
    bytes32 amount;
    address merchant;
  }

  mapping (address => person) customer;

  function saveCustomerTransaction(address _person, bytes32 _account, bytes32 _amount, address _merchant) {
    person memory user;
    user.bankaccountNumber = _account;
    user.amount = _amount;
    user.merchant = _merchant;

    customer[_person] = user;
  }

  function getCustomerTransaction(address _person) constant returns (bytes32, bytes32, address) {
    person memory getCustomer;
    getCustomer = customer[_person];
    return (getCustomer.bankaccountNumber, getCustomer.amount, getCustomer.merchant);
  }
}