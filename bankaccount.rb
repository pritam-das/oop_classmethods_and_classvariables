class BankAccount
    @@interest_rate = 1.15   #15% interest rate
    @@accounts = []



###############Class Methods###############################

    def self.create                             #(name="Account number #{@@accounts.length}")
      @new_account = BankAccount.new
      @@accounts << @new_account
      @new_account
    end

    def self.total_funds
      funds = 0
      @@accounts.each do |account|
        funds += account.balance
      end
      funds
    end

    def self.interest_time

      @@accounts.each do |account|
        account.balance = (@@interest_rate * account.balance).to_i
      end

    end

#################Instance Methods###############################
    attr_accessor :balance

    def initialize #(name)
      @balance = 0
      #@name = "Account number #{@@accounts.length}"

    end

    def deposit
      puts "Enter the amount in dollars that you want to deposit to your account"
      amount = gets.chomp.to_i
      @balance += amount
    end

    def withdraw
      puts "Enter the amount in dollars that you want to withdraw from your account"
      amount = gets.chomp.to_i
      @balance -= amount
    end

end
