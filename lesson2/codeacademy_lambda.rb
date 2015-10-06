#1 make a lambda to check if an item in the array is a symbol and then push the symbols into an array called "symbols"

my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

symbol_filter = lambda{|x| x.is_a? Symbol}

symbols = my_array.select(&symbol_filter)

p symbols



# 2 create a lambda that selects crew members with names that come before M
crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}

first_half = lambda{|k, v| v < "M"}
a_to_m = crew.select(&first_half)
p a_to_m