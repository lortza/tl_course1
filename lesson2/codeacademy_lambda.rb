#make a lambda to check if an item in the array is a symbol and then push the symbols into an array called "symbols"

my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

symbol_filter = lambda{|x| x.is_a? Symbol}

symbols = my_array.select(&symbol_filter)

p symbols