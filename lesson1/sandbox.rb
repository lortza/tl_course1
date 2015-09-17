def change_name(x)
  x = 'bob'  
end

name = 'jim'

change_name(name)
puts name           # => jim

name = change_name(name)
puts name  # => bob

puts "---------------------"


def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name           # => Jim






