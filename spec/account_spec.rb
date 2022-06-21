require 'account'

describe Account do
  it 'initializes with a balance of zero' do
    expect(subject.balance).to eq 0
  end

  describe '#deposit' do
    it 'add an amount to the balance' do
      subject.deposit(500)
      expect(subject.balance).to eq 500
    end
  end

  describe '#withdraw' do
    it 'removes an amount from the balance' do
      subject.deposit(500)
      subject.withdraw(200)
      expect(subject.balance).to eq 300
    end
  end
end
