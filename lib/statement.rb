# frozen_string_literal: true

class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def display
    puts('date || credit || debit || balance')
    transactions.each do |transaction|
      puts([
        transaction.date.strftime('%d/%m/%Y'),
        transaction.credit ? format('%.2f', transaction.credit) : nil,
        transaction.debit ? format('%.2f', transaction.debit) : nil,
        format('%.2f', transaction.new_balance)
      ].join(' || '))
    end
  end

  def add(transaction)
    @transactions << transaction
  end
end
