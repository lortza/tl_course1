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


#3 In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class. When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

#answer: it came from the self.class in this line:
puts "I am a #{self.class} and going super fast!"

#4 If we have a class AngryCat how do we create a new instance of this class?
x = AngryCat.new

#5 Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

#answer: Pizza because @name has an @


#6 What could we add to the class below to access the instance variable @volume?

class Cube
  # attr_accessor :volume
  def initialize(volume)
    @volume = volume
  end #initialize
end #Cube

#solution A
class Cube
  attr_accessor :volume # => add this line
  def initialize(volume)
    @volume = volume
  end #initialize
end #Cube

c = Cube.new(5)
p c.volume # => to use this line

# Solution B
class Cube
  def initialize(volume)
    @volume = volume
  end #initialize

  def show_volume # => add this method to call the variable
    @volume
  end #show_volume
end #Cube

c = Cube.new(5)
p c.show_volume # => to use this line


#7 What is the default thing that Ruby will print to the screen if you call to_s on an object? Where could you go to find out if you want to be sure?

#answer: the id number of the instance of that class. go to irb and create an instance of a class. this will render the number.


#8 If we have a class such as the one below, You can see in the make_one_year_older method we have used self. What does self refer to here?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

#answer: .self is referring to the instance of the class, not class itself


# 9 If we have a class such as the one below. In the name of the cats_count method we have used self. What does self refer to in this context?

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

#answer: the self in self.cats_count is making this a class level method. the self is referring to the class. this means it's counting the number of instance of the whole Cat class, not an individual instance of Cat.






