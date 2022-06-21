# Bank Tech Test

## How To Use The Program
* Open your terminal and navigate to this folder
* First, install any required gems using 'bundle install'
* Open irb
* Require the account.rb file
* Create a new instance of account
* Here, you can deposit or withdraw money to this account, and print the statement.

Example:
    bundle install
    irb
    require('./lib/account.rb')
    a = Account.new # this create a new account instance
    a.deposit(500) # this will deposit £500 to this account
    a.withdraw(100) # this will withdraw £100 from this account
    print(a.statement.display) # this will print the transaction history for this account to the console


## How To Run The Tests
* You can run the test suite on rspec

## Approach/Structure
* Each class is responsible for a single part of the functionality. 
* The Account class is responsible for changing the balance, and calling the Statement class to log the transaction.
* The Transaction class is responsible for storing information about the transaction - date, amount and running balance.
* The Statement class is responsible for storing transaction objects & displaying the history to the user.

