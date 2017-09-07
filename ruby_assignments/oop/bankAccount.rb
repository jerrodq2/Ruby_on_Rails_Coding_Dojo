class BankAccount
  @@accounts = 0
  attr_reader :account_number, :checking_balance, :saving_balance
  def initialize()
    @@accounts += 1
    acct
    @checking_balance = 0
    @saving_balance = 0
    @interest_rate = '5%'
  end
  def return_account_number
    puts @account_number
    self
  end
  def return_saving_balance
    puts @saving_balance
    self
  end
  def return_checking_balance
    puts @checking_balance
    self
  end
  def deposit(acct, num)
    if acct == 'checking'
      @checking_balance += num
    else
      @saving_balance += num
    end
    self
  end
  def withdraw(acct, num)
    if acct == 'checking'
      if num > @checking_balance
        return 'Not enough funds in Checking Account'
      else
        @checking_balance -= num
      end
    else
      if num > @saving_balance
        return 'Not enough funds in Saving Account'
      else
        @saving_balance -= num
      end
    end
    self
  end
  def total
    puts "You have $#{@saving_balance} in your savings account and $#{@checking_balance} in your checking account, in total: $#{@saving_balance + @checking_balance}"
    self
  end
  def account_info
    puts "account number: #{@account_number}"
    puts "total money: #{@checking_balance + @saving_balance}"
    puts "checking: #{@checking_balance}"
    puts "savings: #{@saving_balance}"
    puts "interest_rate: #{@interest_rate}"
  end

  private
  attr_reader :interest_rate
  def acct
    @account_number = rand(1..100)
  end
end
derek = BankAccount.new
derek.account_info
