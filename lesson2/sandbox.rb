# Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. Create a better_grade_than? method, that you can call like so...

# puts "Well done!" if joe.better_grade_than?(bob)

class Student

  def initialize(n, g)
    @name = n
    @grade = g
  end #initialize

  def better_grade_than?(student2)
    grade_getter > student2.grade_getter
  end #better_grade_than?

  protected
  def grade_getter
    @grade
  end #grade_getter

end #Student

j = Student.new("Joe", 98)
b = Student.new("Bob", 93)
c = Student.new("Carl", 80)
puts "Well done!" if j.better_grade_than?(b)