# You are hosting a seminar and need to assign seats to your attendees. 
# You have 3 rows with 3 seats in each row. You have 6 attendees. 
# Assign each person a seat making sure that everyone is seated as close 
# to the front as possible. Row A is the first row. A seat name looks like "A1", not "1A". Then output a list of names and seat numbers so the usher can seat each person in the right place. 

rows = ["A", "B", "C", "D"]
seat_numbers = [1, 2, 3]
people = ["Angela", "Bill", "Christine", "Darla", "Edward", "Frank"]


# ======== SOLUTION ============
available_seats = []
seat_assignments = []

# Create array of available seats
rows.each do |row|
  seat_numbers.each do |num|
    available_seats << "#{row}#{num}"
  end#seat_numnbers
end #rows

# Assign a seat to each person
people.each do |person|
  seat_assignments << {:name => "#{person}", :seat => "#{available_seats.shift}"}
end#people.each

# Generate list of names and seat assignments
seat_assignments.each do |person|
  puts "#{person[:name]}: #{person[:seat]}"
end#seat_assignments.each

# Part 1: There are 3 children who each need a complete snack with 1 food and 1 drink. Create an array of hashes to randomly assign a complete snack to a child. Create a list of children's names and their snacks so the adults know what to serve. 

children = ["Andrew", "Betty", "Carl"]
drinks = ["Water", "Milk", "Orange Juice"]
foods = ["Apple", "Peanut Butter", "Banana"]


# =======SOLUTION==============

children.each do |child|
  puts "#{child}: #{drinks.sample} & #{foods.sample}"
end#children.each



# Part 2: Push those assignments into an array of hashes using the 
# symbols :name, :drink, and :food as keys. Output the results.


# =======SOLUTION==============

assignments = []

children.each do |child|
  assignments << {:name => child, :drink => drinks.sample, :food => foods.sample} 
end#children

puts assignments



