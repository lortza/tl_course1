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


#5 You are given the following class that has been implemented:
class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end #initialize
  
end #KrispyKreme

#And the following specification of expected behavior:
donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

#Write additional code for KrispyKreme such that the puts statements will work as so:
puts donut1 #=> "Plain"
puts donut2 #=> "Vanilla"
puts donut3 #=> "Plain with sugar"
puts donut4 #=> "Plain with chocolate sprinkles"
puts donut5 #=> "Custard with icing"

#solution is to add this method inside the KrispyKreme class:
def to_s
    if @filling_type == nil && @glazing == nil
      "Plain"
    elsif @filling_type == nil
      "Plain with " + @glazing
    elsif @glazing == nil
      @filling_type
    else
      @filling_type + " with " + @glazing
    end #if
  end #to_s

  # the book solution uses true & false, which is really elegant:
  def to_s
    filling_string = @filling_type ? @filling_type : "Plain"
    glazing_string = @glazing ? " with #{@glazing}" : ''
    filling_string + glazing_string
  end


# 6 If we have these two methods, What is the difference in the way the code works?

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end #create_template

  def show_template
    template
  end #show_template
end #Computer


class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end #create_template

  def show_template
    self.template
  end #show_template
end #Computer

#answer: the self. is calling that method on the instance of the class. this is unnecesary as it is already an instance-level method. it works the same way as the other method, it's just bad practice. 

