function makeAccount(number) {
  var balance = 0;
  var transactions = [];

  return {
    deposit: function(amount) {
      balance += amount;
      transactions.push({type: 'deposit', amount: amount});
      return amount;
    },
    withdraw: function(amount) {
      if (amount > balance) {
        amount = balance;
      }
      balance -= amount;
      transactions.push({type: 'withdraw', amount: amount});
      return amount;
    },
    balance: function() {
      return balance;
    },
    number: function() {
      return number;
    },
    transactions: function() {
      return transactions;
    },
  };
}

function makeBank() {
  var number = 101;
  var accounts = [];

  return {
    openAccount: function() {
      var account = makeAccount(number++);
      accounts.push(account);
      return account;
    },
    transfer: function(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    }
  };
};

var bank = makeBank();
bank.transactions;
bank.transactions();
