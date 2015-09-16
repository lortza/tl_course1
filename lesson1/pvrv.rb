#NOTE: this is based on a confusing and rambling lecture explanation.

# Pass By Value: 
# only ever passes the vlaue and not the actual reference
def some_method(str)
  str.changeit
  return new_str
end

outer_str = "hi"
outer_str = some_method(outer_str)


# Pass By Reference:
# when i make a change to the inner var, the outer var is being changes
def some_method(str)
  str.changeit
end

outer_str = "hi"
some_method(outer_str)


# additional example using objects
def some_method(str)
  str.uniq
end

outer_obj = [1, 2, 2, 3, 3, 4, 5]
some_method(outer_obj)

puts outer_obj
