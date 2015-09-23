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
