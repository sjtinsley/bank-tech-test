require 'account'

describe Account do
  let(:mock_transaction) { double :transaction }
  let(:mock_statement) { double :statement, add: 'transction added' }
  let(:statement_class_dbl) { double :statement_class, new: mock_statement }
  let(:transaction_class_dbl) { double :transaction_class, new: mock_transaction }
  let(:account) { Account.new(statement_class = statement_class_dbl, transaction_class = transaction_class_dbl) }

  it 'initializes with a balance of zero' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do
    it 'add an amount to the balance' do
      account.deposit(500)
      expect(account.balance).to eq 500
    end

    it 'calls the statement class to add the transaction' do
      expect(mock_statement).to receive(:add)
      expect(transaction_class_dbl).to receive(:new)
      account.deposit(500)
    end
  end

  describe '#withdraw' do
    it 'removes an amount from the balance' do
      account.deposit(500)
      account.withdraw(200)
      expect(account.balance).to eq 300
    end

    it 'calls the statement class to add the transaction' do
      expect(mock_statement).to receive(:add)
      expect(transaction_class_dbl).to receive(:new)
      account.withdraw(200)
    end
  end
end
