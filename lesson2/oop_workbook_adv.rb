# Advanced Questions
# http://www.gotealeaf.com/books/oo_workbook/read/advanced_quiz_1

#1 Alyssa has been assigned a task of modifying a class that was initially created to keep track of secret information. The new requirement calls for adding logging, when clients of the class attempt to access the secret data. Here is the class in its current form:

class SecretFile
  attr_reader :data

  def initialize(secret_data)
    @data = secret_data
  end #initialize

end #SecretFile

# She needs to modify it so that any access to data must result in a log entry being generated. That is, any call to the class which will result in data being returned must first call a logging class. The logging class has been supplied to Alyssa and looks like the following

class SecurityLogger
  
  def create_log_entry
    # ... implementation omitted ...
  end #create_log_entry

end #SecurityLogger
 
 # Hint: assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger be passed in as an additional argument.

 #solution: i don't really get it and the book solution doesn't make sense to me. 



 #2 Ben and Alyssa are working on a vehicle management system. So far, they have created classes called Auto and Motorcycle to represent automobiles and motorcycles. After having noticed common information and calculations they were performing for each type of vehicle, they decided to break out the commonality into a separate class called WheeledVehicle. This is what their code looks like so far:

class WheeledVehicle
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures along with 
    super([20,20], 80, 8.0)
  end
end

# Now Alan has asked them to incorporate a new type of vehicle into their system - a Catamaran defined as follows:

class Catamaran
  attr_accessor :propeller_count, :hull_count, :speed, :heading, :range

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

# This new class does not fit well with the object hierarchy defined so far. Catamarans don't have tires. But we still want common code to track fuel efficiency and range. Modify the class definitions and move code into a Module, as necessary, to share code among the Catamaran and the wheeled vehicles.

#solution:
module WheeledVehicle
  def initialize(tire_array)
    @tires = tire_array
  end #initialize

  def tire_pressure(tire_index)
    @tires[tire_index]
  end #tire_pressure

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end #inflate_tire
end #WheeledVehicle


class Vehicle
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < Vehicle
  include WheeledVehicle

  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end #initialize
end #Auto

class Motorcycle < Vehicle
  include WheeledVehicle

  def initialize
    # 2 tires are various tire pressures along with 
    super([20,20], 80, 8.0)
  end #initialize
end #Motorcycle

class Catamaran < Vehicle
  attr_accessor :propeller_count, :hull_count, :speed, :heading, :range

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end #initialize
end #Catamaran


#3 Building on the prior vehicles question, we now must also track a basic motorboat. A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers. How would you modify the vehicles code to incorporate a new Motorboat class?
module WheeledVehicle
  def initialize(tire_array)
    @tires = tire_array
  end #initialize

  def tire_pressure(tire_index)
    @tires[tire_index]
  end #tire_pressure

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end #inflate_tire
end #WheeledVehicle


module FloatingVehicle
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end #initialize
end #FloatingVehicle


class Vehicle
  attr_accessor :speed, :heading

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < Vehicle
  include WheeledVehicle

  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end #initialize
end #Auto

class Motorcycle < Vehicle
  include WheeledVehicle
  def initialize
    # 2 tires are various tire pressures along with 
    super([20,20], 80, 8.0)
  end #initialize
end #Motorcycle

class Catamaran < Vehicle
  include FloatingVehicle
  attr_accessor :propeller_count, :hull_count, :speed, :heading, :range
end #Catamaran

class Motorboat < Vehicle
  include FloatingVehicle
  attr_accessor :speed, :heading, :range

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = 1
    @num_hulls = 1
    @km_traveled_per_liter = km_traveled_per_liter
    @liters_of_fuel_capacity = liters_of_fuel_capacity
  end #initialize

end #Motorboat

