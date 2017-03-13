# Todo List

As every other lazy ruby programmer, we don't do anything, unless we have a todo list.
This is why we will create our own Todo List in ruby.

## Todo

We should create a `Todo` class, in which we will store our tasks. Our `Todo`s will have a name, description, priority and date.

The `Todo` class will be initialized like:

`Todo.new(name, description, priority, date)`

Our `Todo`'s should be able to give us their attributes:

```ruby
todo = Todo.new('Take dog out', 'I should probably take out the dog', 'High', '24.02.2017')

todo.name => 'Take dog out'
todo.description  => 'I should probably take out the dog'
todo.priority => :high
todo.date => '24.04.2017'
```

Our todos will have 4 priorities: `'Low', 'Medium', 'High', 'Critical'`
Priorities should be stored as small letter symbols like:
`:low :medium :high :critical`

## Organizer

We should have an organizer class, the organizer will collect our todos, and keep them together.

`Organizer.new(todos)`

We should be able to add new todos to our organizer:

Example:

```ruby

organizer = Organizer.new

todo = Todo.new('Dog', 'Take dog out', 'High', '24.02.2017')
organizer << todo
organizer => <Organizer... <Todo @name = 'Dog'...>>

```

####list

Whenever we need, we have to be able to print our Todo list:
We should pad our strings so that we dont mess up our list.

```ruby

organizer = Organizer.new

todo = Todo.new('Dog', 'Take dog out', 'High', '24.02.2017')
organizer << todo
todo = Todo.new('Dishes', 'Wash the dishes', 'Low', '24.02.2018')
organizer << todo

puts organizer.list #=> 
| Id |   Name |     Description | Priority |       Date |
|  1 |    Dog |    Take dog out |     High | 24.02.2017 |
|  2 | Dishes | Wash the dishes |      Low | 24.02.2018 |

```

####order

We should be able to sort our todos by date and priority with method `order`:
So we use organizer with two arguments inside a hash:
`organizer.order(by: :priority, order: :asc)`
`organizer.order(by: :date, order: :desc)`

First argument is a hash with key `:by` and value `:priority/:date`
Second argument is the hash with key `:order`the sorting of the todos we want: descending or ascending.


```ruby

organizer = Organizer.new

todo = Todo.new('Dog', 'Take dog out', 'High', '24.02.2017')
organizer << todo

todo = Todo.new('Dishes', 'Wash the dishes', 'Low', '24.02.2018')
organizer << todo

todo = Todo.new('Study', 'Study for exams', 'Critical', '24.02.2019')
organizer << todo

organizer.order(by: :date, order: :asc)
puts organizer.list #=>

| Id |   Name |         Description | Priority |       Date |
|  1 |    Dog |        Take dog out |     High | 24.02.2017 |
|  2 | Dishes |     Wash the dishes |      Low | 24.02.2018 |
|  3 |  Study | Study for the exams | Critical | 24.02.2019 |

organizer.order(by: :priority, order: :desc)
puts organizer.list #=>

| Id |   Name |         Description | Priority |       Date |
|  1 |  Study | Study for the exams | Critical | 24.02.2019 |
|  2 |    Dog |        Take dog out |     High | 24.02.2017 |
|  3 | Dishes |     Wash the dishes |      Low | 24.02.2018 |
```

####take

We should be able to `take` the first(n) elements from the organizer.

```ruby 

organizer = Organizer.new

todo = Todo.new('Dog', 'Take dog out', 'High', '24.02.2017')
organizer << todo

todo = Todo.new('Dishes', 'Wash the dishes', 'Low', '24.02.2018')
organizer << todo

todo = Todo.new('Study', 'Study for exams', 'Critical', '24.02.2019')
organizer << todo

organizer.order(by: :date, order: :desc)
p organizer.take(2).list #=> 

| Id |   Name |         Description | Priority |       Date |
|  1 | Dishes |     Wash the dishes |      Low | 24.02.2018 |
|  2 |    Dog |        Take dog out |     High | 24.02.2017 |
```

####start

We won't start doing our todos if we don't have an Enumerator to keep track where we are at.

```ruby 

organizer = Organizer.new

todo = Todo.new('Dog', 'Take dog out', 'High', '24.02.2017')
organizer << todo

todo = Todo.new('Dishes', 'Wash the dishes', 'Low', '24.02.2018')
organizer << todo

todo = Todo.new('Study', 'Study for exams', 'Critical', '24.02.2019')
organizer << todo

organizer.order(by: :priority, order: :desc)
doing_tasks = organizer.start

doing_tasks => "Enumerator <todo1, todo2, todo3....>"

doing_tasks.next.name => 'Study'
doing_tasks.next.name => 'Dog'

```
