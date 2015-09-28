#Intermediate questions
#http://www.gotealeaf.com/books/oo_workbook/read/intermediate_quiz_1

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


#3 In the last question Alyssa showed Alan this code which keeps track of items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end
# Alan noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this to change attr_reader to attr_accessor.

# Is there anything wrong with fixing it this way?

#answer: it's not a very rails-friendly fix. 
# book answer: Nothing incorrect syntactically. However, you are altering the public interfaces of the class. In other words, you are now allowing clients of the class to change the quantity directly (calling the accessor with the instance.quantity = <new value> notation) rather than by going through the update_quantity method. It means that the protections built into the update_quantity method can be circumvented and potentially pose problems down the line.


# Let's practice creating an object hierarchy.

# Create a class called Greeting with a single method called greet that takes a string argument and prints that argument to the terminal.

# 4 Now create two other classes that are derived from Greeting: one called Hello and one called Goodbye. The Hello class should have a hi method that takes no arguments and prints "Hello". The Goodbye class should have a bye method to say "Goodbye". Make use of the Greeting class greet method when implementing the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.

class Greeting
  def greet(message)
    puts message
  end #greet
end #Greeting


class Hello < Greeting
  def say_hi
     greet("hi (this is Hello's say_hi method)")
  end #say_hi
end #Hello

class Goodbye < Greeting
  def say_bye
    greet("bye (this is Goodbye's say_bye method)")
  end #say_bye
end #Goodbye

g = Greeting.new
p g.greet("sample tester class greeting")

h = Hello.new
p h.say_hi

b = Goodbye.new
p b.say_bye


