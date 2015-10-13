# message = "A Cab"
# decoded_message = "x"
# encoder = []
# decoder = []

# message.upcase!

# puts message

# message.split("").each do |x|
#   if x == "A"
#     x = "D"
#   elsif x == "B" 
#     x = "E"
#   elsif x == "C"
#     x = "F"
#   else 
#     x = " "
#   end
#   encoder << x
# end #each
# p encoder
# coded_message = encoder.join("")
# p coded_message


# coded_message.split("").each do |x|
#   if x == "D"
#     x = "A"
#   elsif x == "E" 
#     x = "B"
#   elsif x == "F"
#     x = "C"
#   else 
#     x = " "
#   end
#   decoder << x
# end #each
# p decoder
# decoded_message = decoder.join("")
# p decoded_message

#===========================

# x = "A"
# 4.times do |x|
#   b = x.next # => x = 0, b = 1
#   x = b # => x = 1
#   puts x
# end #do

# cypher = []

# alphabet = ("A".."Z").to_a
# alphabet.each do |x|
#   b = x.next # => B
#   c = b.next # => C
#   d = c.next # => D
#   cypher << {raw: x, coded: d}
# end #each

# # p cypher
# puts "cypher 0 raw: #{cypher[0][:raw]}"

# message = "This is a secret"
# translator = []
# coded_message = []

# message.upcase!

# message.split("").each do |x|
#   translator << x
# end #each
# p translator

# translator.each do |x|
#   if x == cypher[:raw]
#     x = cypher[:coded]
#     coded_message << x
#     p x
#   else
#     coded_message << " "
#   end #if
# end #each

# p coded_message

# #===============================

alphabet = ("A".."Z").to_a
shifted_alphabet = ("A".."Z").to_a
catcher = shifted_alphabet.shift(3)
shifted_alphabet = shifted_alphabet << catcher
shifted_alphabet.flatten!
cypher_pairs = alphabet.zip(shifted_alphabet)

# puts "catcher #{catcher}"
# puts "alphabet        : #{alphabet}"
# puts "shifted_alphabet: #{shifted_alphabet}"
# puts "cypher_pairs #{cypher_pairs}"


message = "This is a secret"
decoded_message = "x"
encoder = []
decoder = []

#================STOPPED HERE=================
#Need to figure out how to map each letter in the message to the pair in the array, then change out the letter to the second item in the array pair

#machine
message.upcase!
translator = message.split("")
translator.each do |x|

end #each


#output
puts "message: #{message}"
puts "translator: #{translator}"







