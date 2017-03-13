## University

We are going back to university!

This time we want you to make a students management system.
We will have three main classes.

```ruby
class University
end
```

```ruby
class Student
end
```

```ruby
class Course
end
```

`University.new(name, array_of_students)`  
We have to be able to give an array of students and name of the university to the University constructor.

Student constructor should look like this.
`Student.new(first_name, last_name, faculty_number)`

Course constructor will take the name of the course and the difficulty of the course.
The difficulty will be `:easy`, `:medium` or `:hard` as a symbols.
`Course.new(course_name, difficulty)`

```ruby
pesho = Student.new("Petur", "Petrov", 88888)
stamat = Student.new("Stamat", "Stamatov", 99999)
university = University.new("Oxford", [pesho, stamat])
```

We have to be able to add new students to the university at any given time.

```ruby
pesho = Student.new("Petur", "Petrov", 88888)
university = University.new("Oxford")
university << pesho
```

We have to be able to take all the students in this university with method `students`.

```ruby
pesho = Student.new("Petur", "Petrov", 88888)
stamat = Student.new("Stamat", "Stamatov", 99999)
university = University.new("Oxford", [pesho, stamat])
university.students
=> #returns all the students in this university in array
```

A student will graduate if the average of all of his grades is higher than 5.0 and he has taken at least 3 courses.
We should implement `take_course(course, grade)` that will somehow save the course, `graduated?` that will tell us 
if this student has graduated and `courses` that will show us all the courses this student has.

```ruby
mathematics = Course.new("Mathematics", :hard)
history = Course.new("History", :easy)
english = Course.new("English", :easy)

stamat = Student.new("Stamat", "Stamatov", 88888)

stamat.take_course(mathematics, 4.0)
stamat.take_course(history, 6.0)
stamat.take_course(english, 6.0)

stamat.courses #=> [mathematics, history, english]

=> #returns all the courses this student has in array

stamat.graduated?
=> true
```

We should be able to take all courses with given difficulty with `find_by(difficulty:)`.

```ruby
mathematics = Course.new("Mathematics", :hard)
history = Course.new("History", :easy)
english = Course.new("English", :easy)

stamat = Student.new("Stamat", "Stamatov", 88888)

stamat.take_course(mathematics, 4.0)
stamat.take_course(history, 6.0)
stamat.take_course(english, 6.0)

stamat.find_courses_by(difficulty: :easy)
=> #returns [history, english]
```
We should implement `University#sort_by_grade_average`, that will sort the students by the average of their grades.

We should implement `University#sort_by_difficulty_of_courses`. It should return first the students who have taken most
courses with difficulty `:hard`, after that the students with difficulty `:medium` and at last with difficulty `:easy`.

```ruby
mathematics = Course.new("Mathematics", :hard)
history = Course.new("History", :hard)
english = Course.new("English", :easy)

stamat = Student.new("Stamat", "Stamatov", 88888)
stamat.take_course(mathematics, 6.0)
stamat.take_course(history, 6.0)

petur = Student.new("Petur", "Petrov", 99999)
petur.take_course(mathematics, 5.0)
petur.take_course(english, 4.50)

university = University.new("Oxford")
university << stamat
university << petur

university.sort_by_difficulty_of_courses
=> #returns [stamat, petur, ...]
```

We should implement `University#graduated_students` that returns all graduated students.

We should implement `University#ungraduated_students` that returns all ungraduated students.

We should implement `University#sort_students_by_taken_courses` that returns the students with most courses in descending order.

We should implement `University#faculty_number_range(range)` that returns the students in this range
