# random pet generator
# ask a person if they want to create a new cat or dog
# create a new dog or cat with a color and disposition
# enter a name for this pet

# Option One: Hashes =========================================
# @colors = ["Brown", "Black", "Yellow", "Chocolate", "White", "Patchy", "Spotted", "Marbled"]
# @dispositions = ["Chatty", "Skittish", "Lap-sitting", "Outdoor-Only", "Lovey", "Standoffish"]
# @features = []

# def pick_features
#   @colors.each do |color|
#     @dispositions.each do |disposition|
#       @features << {color: color, disposition: disposition}
#     end #dispositions
#   end #colors
# end #pick_features

# pick_features
# @features.shuffle!
# pet = @features.pop
# puts "Please enter a name for your new pet:"
# petname = gets.chomp
# pet[:name] = petname
# puts "Your new pet #{pet[:name]} is #{pet[:color].downcase} and #{pet[:disposition].downcase}"

# Option Two: Arrays =========================================
animal = ["cat", "dog"]
color = ["Brown", "Black", "Yellow", "Chocolate", "White", "Patchy", "Spotted", "Marbled"]
disposition = ["Chatty", "brutish", "Skittish", "Lap-sitting", "Outdoor-Only", "Lovey", "Standoffish"]
options = [animal, color, disposition]

puts "Please enter a name for your new pet:"
petname = gets.chomp
pet = []
pet << petname
options.each do |option|
  pet << option.sample.downcase
end #options

puts "Your new pet #{pet[0]} is a #{pet[3]}, #{pet[2]} #{pet[1]}."




# Option Three: Classes =========================================

class Pet
  def initialize #everything that must happen when a new Pet is created  
    @pet = {}
    @animals = ["dog", "cat", "goat", "parakeet", "python"]
    @colors = ["brown", "black", "yellow", "gray", "white", "patchy", "spotted", "marbled", "multicolored"]
    @dispositions = ["chatty", "brutish", "skittish", "lap-sitting", "lovey", "standoffish", "chompey"]
    generate_pet # uses method below to generate a pet upon initilization
  end #initialize

  def generate_pet # creates a random set of traits for each pet
    @pet[:animal] = @animals.sample
    @pet[:color] = @colors.sample
    @pet[:disposition] = @dispositions.sample
    @pet # returns the new @pet hash
  end #generate_pet

  def name_pet
    puts "Enter a name for your new pet:"
    entry = gets.chomp
    @pet[:name] = entry
    sleep(1)
    puts "Thinking..."
    sleep(1)
    puts "Your new pet #{@pet[:name]} is a #{@pet[:disposition]}, #{@pet[:color]} #{@pet[:animal]}."
  end #name_pet
end #Pet

x = Pet.new
x.name_pet



