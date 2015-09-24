
class Person
  attr_reader :name
  def initialize(n)
    @name = n
  end
end

bob = Person.new("Steve")
#bob.name = "Bob"
puts bob.name