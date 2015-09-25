class Animal

  def initialize(n, f, a)
    @name = n
    @fur = f
    @age = a
  end #initialize

  def speak
    "Hello! I'm #{@name}"
  end #speak
end #Animal

class Dog < Animal
  def speak
    "ARF! I'm #{@name}! [humps leg]"
  end #speak
end #Dog

class Cat < Animal
  def speak
    super + ". I'm a cat."
  end #speak
end #Cat

class Turtle < Animal
end #Cat

d1 = Dog.new("Sparky", "brown", 4)
c1 = Cat.new("Mittens", "tabby", 3)
#t1 = Turtle.new("Yerdle", "snapper", 1)

# puts d1.speak
# puts c1.speak
# puts t1.speak
