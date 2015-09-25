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

#show honda
#p h

#show all vehicles
#puts Vehicle.show_vehicle_count

#show Jeep going through a snowbank
#p j.climb_snowbank

# print to screen the method lookup
#p Car.ancestors

#show age of a vehicle
p t.show_vehicle_age