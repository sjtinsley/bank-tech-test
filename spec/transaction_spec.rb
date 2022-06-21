require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new('2023-01-01', credit: 1000, debit: nil, new_balance: 1000) }

  it 'correctly initializes with the specificed arguments' do
    expect(transaction).to have_attributes(created_at: '2023-01-01', credit: 1000, debit: nil, new_balance: 1000)
  end
end
