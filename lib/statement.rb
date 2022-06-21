# frozen_string_literal: true

class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def display
    statement = ['date || credit || debit || balance']
    @transactions.each do |transaction|
      statement << ([
        transaction.created_at.strftime('%d/%m/%Y'),
        transaction.credit ? format('%.2f', transaction.credit) : nil,
        transaction.debit ? format('%.2f', transaction.debit) : nil,
        format('%.2f', transaction.new_balance)
      ].join(' || '))
    end
    statement.join("\n")
  end

  def add(transaction)
    @transactions.unshift(transaction)
  end
end
