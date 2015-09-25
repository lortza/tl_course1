# Book Exercises

# http://www.gotealeaf.com/books/oo_ruby/read/the_object_model#modules

#1 How do we create an object in Ruby? Give an example of the creation of an object.

class Owner
end#class

o = Owner.new


#2 What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

#Answer: a module allows us to reuse methods across different classes

module Speak
  def speak(sound)
    puts "#{sound}"
  end#speak
end#module

class Owner
  include Speak
end#class

o = Owner.new


#3 When running the following code, We get the following error...
# test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
# Why do we get this error and how to we fix it?


class Person
  attr_reader :name
  def initialize(n)
    @name = n
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

#answer: because @name has not been authorized for modification, only for viewing. To change it, it sholuld be attr_accessor (or attr_writer).


# Inheritance Exercises
#http://www.gotealeaf.com/books/oo_ruby/read/inheritance#exercises

# 1 Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

#Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

class Vehicle

  def initialize(y, c, m, mpg)
    @year = y
    @color = c
    @model = m
    @mpg = mpg
    @speed = 0
  end #initialize

  def calculate_gas_cost
    puts "Enter your one-way trip distance in miles:"
    trip_miles = gets.chomp.to_i
    puts "Will this be a round-trip?  Y  |  N"
    round_trip = gets.chomp.upcase
    if round_trip.include? "Y"
      trip_miles *= 2
    end #if
    gallon_price = 1.80
    gallons_needed = trip_miles / @mpg
    @trip_cost = gallons_needed * gallon_price
    puts "In your #{@year} #{@model}, your #{trip_miles}-mile trip will require $#{@trip_cost.to_i} in gas."

  end #calculate_gas_cost

  def accelerate(number)
    @speed += number
    puts "You just sped up by #{number} mph."
    current_speed
  end #accelerate

  def slow_down(number)
    @speed -= number
    puts "You just slowed down by #{number} mph."
    current_speed
  end #slow_down

  def shut_off
    @speed = 0
    puts "You shut off the engine."
  end #shut_off

  def info
    puts "Your car is a #{@color} #{@year} #{@model}."
  end #info

  def current_speed
    puts "Your current speed is #{@speed}"
    end #current_speed

end#Vehicle

class Car < Vehicle
  VIN = "KNAG6726TG398H2"
  NUMBER_OF_DOORS = 4
end #Car

class Truck < Vehicle
  VIN = "AG672BT6XG39ES2"
  NUMBER_OF_DOORS = 2
end #Truck


#2 Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.
class Vehicle

  @@vehicle_count = 0

  def self.show_vehicle_count
    puts "There are now #{@@vehicle_count} vehicles."
  end #show_vehicle_count

  def initialize(y, c, m, mpg)
    @year = y
    @color = c
    @model = m
    @mpg = mpg
    @speed = 0
    @@vehicle_count += 1
  end #initialize

  def calculate_gas_cost
    puts "Enter your one-way trip distance in miles:"
    trip_miles = gets.chomp.to_i
    puts "Will this be a round-trip?  Y  |  N"
    round_trip = gets.chomp.upcase
    if round_trip.include? "Y"
      trip_miles *= 2
    end #if
    gallon_price = 1.80
    gallons_needed = trip_miles / @mpg
    @trip_cost = gallons_needed * gallon_price
    puts "In your #{@year} #{@model}, your #{trip_miles}-mile trip will require $#{@trip_cost.to_i} in gas."

  end #calculate_gas_cost

  def accelerate(number)
    @speed += number
    puts "You just sped up by #{number} mph."
    current_speed
  end #accelerate

  def slow_down(number)
    @speed -= number
    puts "You just slowed down by #{number} mph."
    current_speed
  end #slow_down

  def shut_off
    @speed = 0
    puts "You shut off the engine."
  end #shut_off

  def info
    puts "Your car is a #{@color} #{@year} #{@model}."
  end #info

  def current_speed
    puts "Your current speed is #{@speed}"
    end #current_speed

end#Vehicle

class Car < Vehicle
  VIN = "KNAG6726TG398H2"
  NUMBER_OF_DOORS = 4
end #Car

class Truck < Vehicle
  VIN = "AG672BT6XG39ES2"
  NUMBER_OF_DOORS = 2
end #Truck


h = Car.new(2008, "black", "Honda", 30)
j = Car.new(2001, "green", "Jeep", 20)
s = Car.new(2000, "tan", "Subaru", 25)
p h

puts Vehicle.show_vehicle_count


#3 Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.

module FourWheelDrive
  def climb_snowbank
    "BOOSH! I'm going through a snowbank!"
  end #climb_snowbank

  def climb_gravel_road
    "YEHAW! I'm climbing this steep gravel grade!"
  end #climb_gravel_road

end #FourWheelDrive


class Vehicle

  @@vehicle_count = 0

  def self.show_vehicle_count
    puts "There are now #{@@vehicle_count} vehicles."
  end #show_vehicle_count

  def initialize(y, c, m, mpg)
    @year = y
    @color = c
    @model = m
    @mpg = mpg
    @speed = 0
    @@vehicle_count += 1
  end #initialize

  def calculate_gas_cost
    puts "Enter your one-way trip distance in miles:"
    trip_miles = gets.chomp.to_i
    puts "Will this be a round-trip?  Y  |  N"
    round_trip = gets.chomp.upcase
    if round_trip.include? "Y"
      trip_miles *= 2
    end #if
    gallon_price = 1.80
    gallons_needed = trip_miles / @mpg
    @trip_cost = gallons_needed * gallon_price
    puts "In your #{@year} #{@model}, your #{trip_miles}-mile trip will require $#{@trip_cost.to_i} in gas."

  end #calculate_gas_cost

  def accelerate(number)
    @speed += number
    puts "You just sped up by #{number} mph."
    current_speed
  end #accelerate

  def slow_down(number)
    @speed -= number
    puts "You just slowed down by #{number} mph."
    current_speed
  end #slow_down

  def shut_off
    @speed = 0
    puts "You shut off the engine."
  end #shut_off

  def info
    puts "Your car is a #{@color} #{@year} #{@model}."
  end #info

  def current_speed
    puts "Your current speed is #{@speed}"
    end #current_speed

end#Vehicle

class Car < Vehicle
  VIN = "KNAG6726TG398H2"
  NUMBER_OF_DOORS = 4
end #Car

class SUV < Vehicle
  include FourWheelDrive

  VIN = "MVY628FG6GL996D"
  NUMBER_OF_DOORS = 5
end #Truck

class Truck < Vehicle
  include FourWheelDrive

  VIN = "AG672BT6XG39ES2"
  NUMBER_OF_DOORS = 2
end #Truck


h = Car.new(2008, "black", "Honda", 30)
j = SUV.new(2001, "green", "Jeep", 20)
s = SUV.new(2000, "tan", "Subaru", 25)
t = Truck.new(1999, "blue", "Ford", 15)

#show honda
#p h

#show all vehicles
#puts Vehicle.show_vehicle_count

#show Jeep going through a snowbank
p j.climb_snowbank

#4 Print to the screen your method lookup for the classes that you have created.

# print to screen the method lookup
p Car.ancestors

#5 Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished.

# did previously

#6 Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the private method is not available from outside of the class. 

module FourWheelDrive
  def climb_snowbank
    "BOOSH! I'm going through a snowbank!"
  end #climb_snowbank

  def climb_gravel_road
    "YEHAW! I'm climbing this steep gravel grade!"
  end #climb_gravel_road

end #FourWheelDrive


class Vehicle

  @@vehicle_count = 0

  def self.show_vehicle_count
    puts "There are now #{@@vehicle_count} vehicles."
  end #show_vehicle_count

  def initialize(y, c, m, mpg)
    @year = y
    @color = c
    @model = m
    @mpg = mpg
    @speed = 0
    @@vehicle_count += 1
  end #initialize

  def show_vehicle_age #pulls in the private method
    "This #{@year} #{@model} is #{calculate_age} years old now."
  end #show_car_age

  #------------------------
  private
  def calculate_age
    today = Time.now.year
    @age = today - @year
    @age
  end #calculate_age

end#Vehicle

class Car < Vehicle
  VIN = "KNAG6726TG398H2"
  NUMBER_OF_DOORS = 4
end #Car

class SUV < Vehicle
  include FourWheelDrive

  VIN = "MVY628FG6GL996D"
  NUMBER_OF_DOORS = 5
end #Truck

class Truck < Vehicle
  include FourWheelDrive

  VIN = "AG672BT6XG39ES2"
  NUMBER_OF_DOORS = 2
end #Truck


h = Car.new(2008, "black", "Honda", 30)
j = SUV.new(2001, "green", "Jeep", 20)
s = SUV.new(2000, "tan", "Subaru", 25)
t = Truck.new(1999, "blue", "Ford", 15)

#show age of a vehicle
p t.show_vehicle_age



#7 Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. Create a better_grade_than? method, that you can call like so...

#puts "Well done!" if joe.better_grade_than?(bob)

class Student

  def initialize(n, g)
    @name = n
    @grade = g
  end #initialize

  def better_grade_than?(student2)
    grade_getter > student2.grade_getter
  end #better_grade_than?

  protected
  def grade_getter
    @grade
  end #grade_getter

end #Student

j = Student.new("Joe", 98)
b = Student.new("Bob", 93)
c = Student.new("Carl", 80)
puts "Well done!" if j.better_grade_than?(b)

