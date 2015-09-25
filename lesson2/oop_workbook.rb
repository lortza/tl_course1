# http://www.gotealeaf.com/books/oo_workbook/read/easy_quiz_1

#1 Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

true # => TrueClass
"hello" # => String
[1, 2, 3, "happy days"] # => Array
142 # => FixNum

# you can find out the class of any object by entering it + .class in irb

#If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed. How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed # insert Speed into this class
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed # insert Speed into this class
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

c = Car.new
t = Truck.new
c.go_fast # => I am a Car and going super fast!
t.go_fast # => I am a Car and going super fast!