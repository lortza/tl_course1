# quiz

#1 What is the value of a after the below code is executed?
a = 1
b = a
b = 3
#answer: a = 1


#2 What's the difference between an Array and a Hash?
#answer: an array is an ordered list. a hash derives its order from key/value pairs

#3 Every Ruby expression returns a value. Say what value is returned in the below expressions:

arr = [1, 2, 3, 3]
[1, 2, 3, 3].uniq #returns [1, 2, 3] but does not mutate the array
[1, 2, 3, 3].uniq! #returns [1, 2, 3] and permanently mutates the array


#4 What's the difference between the map and select methods for the Array class? Give an example of when you'd use one versus the other.
# answer: map returns an array of values being returned by the block. select returns the values being iterated over. map is useful for generating a new array with the results of a block. select is useful for finding something within an existing array. 
# examples from the solutions page:
[1, 2, 3, 4, 5].map { |n| n + 1 }        # => [2, 3, 4, 5, 6]
[1, 2, 3, 4, 5].select {|n| n.odd? }     # => [1, 3, 5]


#5 Say you wanted to create a Hash. How would you do so if you wanted the hash keys to be String objects instead of symbols?
#answer: hash = {"key" => "value"}


#6 What is returned?
x = 1
x.odd? ? "no way!" : "yes, sir!"
#answer: "no way" because x.odd? is TRUE and "no way" is in the TRUE position of that line of code


#7 What is x?
x = 1
3.times do
  x += 1
end
puts x
#answer: x == 4


#8 What is x?
3.times do
  x += 1
end
puts x
#answer: this doesn't work because x only lives inside the loop. it has to be initialiszed outside of the loop if it is to be called outside of the loop

