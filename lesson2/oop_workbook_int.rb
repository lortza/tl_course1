#1 Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end
# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

#"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

# Who is right, Ben or Alyssa, and why?

#answer: 
# Ben is right because he made "balance" available via the attr_reader. 


#2 Alyssa created the following code to keep track of items for a shopping cart application she's writing. Alan looked at the code and spotted a mistake. "This will fail when update_quantity is called", he says. Can you spot the mistake and how to address it?

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end

end #InvoiceEntry

#answer: he's used attr_reader, which does not allow for writing to that variable

