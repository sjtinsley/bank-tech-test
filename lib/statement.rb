# frozen_string_literal: true

class Statement
  attr_reader :transactions

  def initialize(transactions=[])
    @transactions = transactions
  end

  def display
    statement = []
    running_balance = 0
    @transactions.each do |transaction|
      running_balance += transaction.credit.nil? ? 0 : transaction.credit
      running_balance -= transaction.debit.nil? ? 0 : transaction.debit
      statement << ([
        transaction.created_at.strftime('%d/%m/%Y'),
        transaction.credit ? format('%.2f', transaction.credit) : nil,
        transaction.debit ? format('%.2f', transaction.debit) : nil,
        format('%.2f', running_balance)
      ].join(' || '))
    end
    statement.push('date || credit || debit || balance')
    statement.reverse.join("\n")
  end

  def add(transaction)
    @transactions << transaction
  end
end
