require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:statement_with_transactions) { Statement.new(transactions=[mock_deposit, mock_withdrawal])}
  let(:mock_deposit) { double :transaction, created_at: Time.parse('2023-09-01'), credit: 1700, debit: nil }
  let(:mock_withdrawal) { double :transaction, created_at: Time.parse('2023-10-01'), credit: nil, debit: 500 }

  it 'initialises with no transactions as a default' do
    expect(statement.transactions).to eq []
  end

  it 'can initialise with a transaction history as a parameter' do
    expect(statement_with_transactions.transactions).to eq [mock_deposit, mock_withdrawal]
  end

  describe '#display' do
    it 'correctly prints an empty statement when there are no transactions' do
      empty_statement = 'date || credit || debit || balance'
      expect(statement.display).to eq empty_statement
    end

    it 'correctly prints a statement with a deposit and withdrawal in the correct order' do
      statement.add(mock_deposit)
      statement.add(mock_withdrawal)
      expected_statement = "date || credit || debit || balance\n01/10/2023 ||  || 500.00 || 1200.00\n01/09/2023 || 1700.00 ||  || 1700.00"
      expect(statement.display).to eq expected_statement
    end
  end

  describe '#add' do
    it 'adds transactions to the statement in the correct order' do
      statement.add(mock_deposit)
      statement.add(mock_withdrawal)
      expect(statement.transactions).to eq [mock_deposit, mock_withdrawal]
    end
  end
end
