# classes and objects
# http://www.gotealeaf.com/books/oo_ruby/read/classes_and_objects_part1

#1 Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

#2 Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

class MyCar

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end #initialize

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
end #MyCar


car1 = MyCar.new(2008, 'black', 'honda')
car1.accelerate(20)


#2 Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

class MyCar

  attr_accessor :color, :speed
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end #initialize

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
end #MyCar


c = MyCar.new(2008, 'black', 'honda')
c.accelerate(20)


#3 You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

class MyCar

  attr_accessor :color, :speed
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end #initialize

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

    def paint_job
      puts "What color do you want to paint your car?"
      @color = gets.chomp
      puts "Voila! Your car is now #{@color}."
    end #paint_job

    def spray_paint(color)
      self.color = color
      puts "You new #{color} paint job looks great!"
    end#spray_paint
end #MyCar


c = MyCar.new(2008, 'black', 'honda')
c.accelerate(20)

# PART 2
# 1 Add a class method to your MyCar class that calculates the gas mileage of any car.

class MyCar

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
end #MyCar


car1 = MyCar.new(2008, 'black', 'Honda', 30)
car2 = MyCar.new(2001, 'green', 'Jeep', 20)
car1.calculate_gas_cost

# 2 Override the to_s method to create a user friendly print out of your object.

class MyCar

  def initialize(y, c, m, mpg)
    @year = y
    @color = c
    @model = m
    @mpg = mpg
  end #initialize

  def to_s
    "Your car is a #{@color} #{@year} #{@model}." # note how there is no puts on this line
  end #to_s

end #MyCar


car1 = MyCar.new(2008, 'black', 'Honda', 30)
car2 = MyCar.new(2001, 'green', 'Jeep', 20)
puts car1



