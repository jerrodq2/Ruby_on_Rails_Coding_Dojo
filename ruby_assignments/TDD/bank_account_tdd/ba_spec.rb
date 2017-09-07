require_relative 'bankAccount'

RSpec.describe BankAccount do
  before do
    @b = BankAccount.new
    @a = BankAccount.new
    @a.deposit('checking', 1000)
    @a.deposit('savings', 1000)
  end

  it 'Should show checking account balance' do
    expect{@b.return_checking}.to output("#{@b.checking}\n").to_stdout
  end

  it "has method that should show total balance" do
    expect{@b.total}.to output("You have $#{@b.savings} in your savings account and $#{@b.checking} in your checking account, in total: $#{@b.savings + @b.checking}\n").to_stdout
  end

  it "has method that should puts a string if user tries to withdraw more money from either account than is in that account" do
    expect(@b.withdraw('checking', 100)).to eq('Not enough funds in Checking Account')
    expect(@b.withdraw('savings', 100)).to eq('Not enough funds in Saving Account')
  end

  it "has method that allows user to withdraw from checking or savings" do
    expect(@a.withdraw('checking', 100)).to eq(@a)
    expect(@a.withdraw('savings', 100)).to eq(@a)
  end

  it "should give error if user tries to print how many bank accounts there are" do
    expect{@a.accounts}.to raise_error(NoMethodError)
  end

  it "should give error if user tries to set the interest rate" do
    expect{@a.interest_rate = 0}.to raise_error(NoMethodError)
  end

  it "should give error if user tries to set any attribute" do
    expect{@a.savings = 1000}.to raise_error(NoMethodError)
    expect{@a.checking = 1000}.to raise_error(NoMethodError)
  end

end
