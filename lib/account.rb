# frozen_string_literal: true

require_relative('./statement')
require_relative('./transaction')

class Account
  attr_reader :balance, :statement

  def initialize(statement_class = Statement, transaction_class = Transaction)
    @balance = 0
    @statement = statement_class.new
    @transaction_class = transaction_class
  end

  def deposit(amount)
    @balance += amount
    @statement.add(@transaction_class.new(debit: nil, credit: amount, new_balance: @balance))
  end

  def withdraw(amount)
    @balance -= amount
    @statement.add(@transaction_class.new(debit: amount, credit: nil, new_balance: @balance))
  end
end
