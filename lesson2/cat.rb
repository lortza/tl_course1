class Cat

  AWESOME_FACTOR = 13

  attr_accessor :name, :fur, :age # this makes it possible to call the name back out
  @@cat_count = 0 # class variable
  @catyears = 0

  def initialize(n, f, a) # this happens every time a new instance of Cat is created
    @name = n
    @fur = f
    @@cat_count += 1 
    @age = a
    @catyears = 0

  end #initialize

  def self.total_cats 
    @@cat_count # this just calls the cat_count class variable, which has counted all of the instances of the Cat class (in line 8)
  end #total_cats

  def age_calculator # uses the @age of each cat to determine it's cat year age
    case @age
    when 0.5..1
      @catyears = @age * 18
    when 1..2
      @catyears = @age * 12
    when 2..4
      @catyears = @age * 10
    when 5..29
      @catyears = @age * 5.5
    when 30..100
      puts "I'm sorry, that's not a realistic age."
    end
    puts "#{@name} is #{@catyears.to_i} cat years old. "
    #@catyears.to_i
  end #age_calculator

  def self.all
    ObjectSpace.each_object(self).to_a
  end
  
end #Cat

puts Cat.total_cats # notice how this is NOT "self.total_cats" # => 0

cat1 = Cat.new("Zorro", "black", 1)
puts cat1.name # => Zorro

cat2 = Cat.new("DaBlanc", "white with a mask", 4)
cat3 = Cat.new("Tuxie", "black & white", 6)
cat4 = Cat.new("DaNooch", "black", 10)

puts "There are now #{Cat.total_cats} cats." # => There are now 3 cats. 

puts cat4.age_calculator

puts "cat1 renders as: #{cat1}"
puts Cat.all