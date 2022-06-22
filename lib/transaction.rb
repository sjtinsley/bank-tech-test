# frozen_string_literal: true

class Transaction
  attr_reader :created_at, :credit, :debit

  def initialize(created_at = Time.now, credit:, debit:)
    @created_at = created_at
    @credit = credit
    @debit = debit
  end
end
