# 1 create a one-line block
odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]
ints = odds_n_ends.select {|x| x.is_a? Integer}
p ints

# 2 create a proc that uses the block
ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]
under_100 = Proc.new {|x| x < 100}
youngsters = ages.select(&under_100)
p youngsters


#3 create a lambda that uses a block
my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]
symbol_filter = lambda{|x| x.is_a? Symbol}
symbols = my_array.select(&symbol_filter)
p symbols

