require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:mock_deposit) { double :transaction, created_at: Time.parse('2023-09-01'), credit: 1700, debit: nil, new_balance: 1700 }
  let(:mock_withdrawal) { double :transaction, created_at: Time.parse('2023-10-01'), credit: nil, debit: 500, new_balance: 1200 }

  it 'initialises with no transactions' do
    expect(statement.transactions).to eq []
  end

  describe '#display' do
    it 'correctly prints an empty statement when there are no transactions' do
      empty_statement = 'date || credit || debit || balance'
      expect(statement.display).to eq empty_statement
    end

    it 'correctly prints a statement with a deposit and withdrawal' do
      statement.transactions.push(mock_withdrawal, mock_deposit)
      expected_statement = "date || credit || debit || balance\n01/09/2023 || 1700.00 ||  || 1700.00\n01/10/2023 ||  || 500.00 || 1200.00"
      expect(statement.display).to eq expected_statement
    end
  end

  describe '#add' do
    it 'adds transactions to the statement' do
      statement.add(mock_deposit)
      expect(statement.transactions).to eq [mock_deposit]
    end
  end
end
