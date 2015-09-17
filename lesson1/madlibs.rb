# ask users for words
# pass in a file that contains text
# search for the keywords "NOUN", "VERB", "ADJECTIVE", "ADVERB"
# replace keywords with appropriate random word from list
# print out results



#dictionary = {:nouns => [], :verbs => [], :adjectives => [], :adverbs => []}

# puts "Welcome to MadLibs! We'll collect a lot of words and then use them in a story."
# puts "Let's build a list of nouns (objects and places)."
# puts "Please type in 5 nouns, hitting Enter after each one:"

# entry = "X"
# puts "Welcome to MadLibs! We'll collect a lot of words and then use them in a story."
# puts "Let's build a list of nouns (objects and places)."

# dictionary.each do |k, v|
#   puts "Please type in 5 #{k}, hitting Enter after each one:"
#   5.times do
#     entry = gets.chomp
#     dictionary[k] << entry
#   end#5times
# puts
# puts "Thanks!"
# end#each

# puts "Now, on with the show!"


# static list of words
# dictionary = {:nouns => ["ball", "door", "chair", "foot", "rug"],
# :verbs => ["sit", "stand", "fart", "scratch", "eat"],
# :adjectives => ["ugly", "fast", "tight", "rusty", "smelly"],
# :adverbs => ["sneakily", "snidely", "perversely", "accurately", "quickly"]}

# sourcing words from text files
nouns_file = File.open('nouns.txt', "r") do |x|
  x.read
end.split.shuffle

verbs_file = File.open('verbs.txt', "r") do |x|
  x.read
end.split.shuffle

adjectives_file = File.open('adjectives.txt', "r") do |x|
  x.read
end.split.shuffle

adverbs_file = File.open('adverbs.txt', "r") do |x|
  x.read
end.split.shuffle

# calling those sourced words into the dictionary hash
dictionary = {:nouns => nouns_file,
:verbs => verbs_file,
:adjectives => adjectives_file,
:adverbs => adverbs_file}


# error testing to make sure there is a source file
def say(msg)
  puts "=> #{msg}"
end

def exit_with(msg)
  say msg
  exit
end

exit_with("No input file") if ARGV.empty?
exit_with("Input file doesn't exist") if !File.exists?(ARGV[0])


# pulling in the source file
contents = File.open(ARGV[0], "r") do |f|
  f.read
end

contents.gsub!("NOUN").each do
  dictionary[:nouns].pop
end#noun

contents.gsub!("VERB").each do
  dictionary[:verbs].pop
end#verb

contents.gsub!("ADJ").each do
  dictionary[:adjectives].pop
end#adj

contents.gsub!("ADV").each do
  dictionary[:adverbs].pop
end#adv

# print out the story with all of the new sub words in place
p contents




