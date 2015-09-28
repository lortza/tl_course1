# this program uses public and private method to access and store pin and balance info for a fictional bank account

#additional assignments:
#1 Include a deposit method that lets users add money to their accounts
#2 Include error checking that prevents users from overdrawing their accounts
#3 Create CheckingAccounts or SavingsAccounts that inherit from Account

class Account
    attr_reader :name, :balance
    def initialize(name, balance=100)
        @name = name
        @balance = balance
    end #initialize
    
    public
    def display_balance(pin_number)
        if pin_number == pin
            puts "Balance: $#{@balance}."
        else
            puts pin_error
        end#if
    end #display_balance
    
    def withdraw(pin_number, amount)
        if pin_number == pin
            @balance -= amount
            puts "Withdrew #{amount}. New balance: $#{@balance}."
        else
            puts pin_error
        end #if
        
    end #withdraw
    
    private
    def pin
        @pin = 1234
    end #pin
    
    def pin_error
        "Access denied: incorrect PIN."
    end #pin_error
end #Account

a = Account.new("Checking") # => <Account:0x007fcb30850ae0 @name="Checking", @balance=100>
a = Account.new("Checking", 5_000) # => <Account:0x007fafb2851a38 @name="Checking", @balance=5000>
p a