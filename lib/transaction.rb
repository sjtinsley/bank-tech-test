# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit, :debit, :new_balance

  def initialize(date = Time.now, credit:, debit:, new_balance:)
    @date = date
    @credit = credit
    @debit = debit
    @new_balance = new_balance
  end
end
