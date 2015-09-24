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