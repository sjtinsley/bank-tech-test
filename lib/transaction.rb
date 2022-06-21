# frozen_string_literal: true

class Transaction
  attr_reader :created_at, :credit, :debit, :new_balance

  def initialize(created_at = Time.now, credit:, debit:, new_balance:)
    @created_at = created_at
    @credit = credit
    @debit = debit
    @new_balance = new_balance
  end
end
