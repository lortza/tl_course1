module Walkable
  def walk
    "I'm walking."
  end #walk
end#Walkable

module Swimmable
  def swim
    "I'm swimming!!!!!"
  end #swim

  def dive
    "I can dive!"
  end #dive
end #Swimmable

module Brushable
  def brush
    "I'm getting brushed!!"
  end #brush
end #Brushable

class Animal
end #Animal

class Mammal < Animal
  def warm_blooded?
    true
  end #warm_blooded?

  def has_teets?
    true
  end#has_teets?
end #Mammal

class Reptile < Animal
  def warm_blooded?
    false
  end #warm_blooded?
end #Reptile

class Dog < Mammal
  include Swimmable
  include Brushable
  include Walkable
end #Dog

class Cat < Mammal
  include Brushable
  include Walkable
end #Cat

class Turtle < Reptile
  include Swimmable 
  include Walkable
end #Cat

d = Dog.new
c = Cat.new
t = Turtle.new

puts d.brush
puts t.swim

puts d.warm_blooded?
puts t.warm_blooded?

puts "---Animal method lookup---"
puts Dog.ancestors

