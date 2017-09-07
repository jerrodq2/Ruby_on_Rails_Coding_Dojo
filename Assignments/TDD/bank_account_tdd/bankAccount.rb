class BankAccount
  @@accounts = 0
  attr_reader :account_number, :checking, :savings
  def initialize()
    @@accounts += 1
    acct
    @checking = 0
    @savings = 0
    @interest_rate = '5%'
  end
  def return_account_number
    puts @account_number
    self
  end
  def return_savings
    puts @savings
    self
  end
  def return_checking
    puts @checking
    self
  end
  def deposit(acct, num)
    if acct == 'checking'
      @checking += num
    else
      @savings += num
    end
    self
  end
  def withdraw(acct, num)
    if acct == 'checking'
      if num > @checking
        return 'Not enough funds in Checking Account'
      else
        @checking -= num
      end
    else
      if num > @savings
        return 'Not enough funds in Saving Account'
      else
        @savings -= num
      end
    end
    self
  end
  def total
    puts "You have $#{@savings} in your savings account and $#{@checking} in your checking account, in total: $#{@savings + @checking}"
    self
  end
  def account_info
    puts "account number: #{@account_number}"
    puts "total money: #{@checking + @savings}"
    puts "checking: #{@checking}"
    puts "savings: #{@savings}"
    puts "interest_rate: #{@interest_rate}"
  end

  private
  attr_reader :interest_rate
  def acct
    @account_number = rand(1..100)
  end
end
derek = BankAccount.new
# derek.account_info
