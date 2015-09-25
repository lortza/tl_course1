module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end #speak
  end #Dog

  class Cat
    def say_name(name)
      p "#{name}"
    end #say_name
  end #Cat
end #Mammal


d = Mammal::Dog.new
c = Mammal::Cat.new
d.speak('Arf!') 
c.say_name('kitty') 