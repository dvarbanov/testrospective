# Friend Database

As ruby programmers we are often very famous and have a lot of friends.
We are going to create our own database for our friends.

Everything should be inside a module called `Friendship`.

Create a `Friend` class.
The constructor is up to you.
The friend class should have the following attributes:
  * name
  * sex (symbol)
  * age

Example:

```ruby
# we have friend 'peter' with attributes: Peter, :male, 28
peter.name #=> 'Peter'
peter.sex #=> :male
peter.age #=> 28
```

The friend class should implement the following functions:
  * `Friend#male?`
  * `Friend#female?`
  * `Friend#over_eighteen?`
  * `Friend#long_name?` (Tells us whether the name is longer than 10 characters.)

```ruby
peter.male? #=> true
peter.female? #=> false
peter.over_eighteen? #=> true
peter.long_name? #=> false
```

We also need a `Database` class in which we will store all of our friends.
The database class should implement a function called `add_friend`, taking a name, sex and age as arguments.


Example:

```ruby
friends = Friendship::Database.new
friends.add_friend('Peter', :male, 28)
friends.add_friend('Maria', :female, 25)
```

Implement a function called `have_any_friends?`.
It should return whether we have friends.

Example:

```ruby
friends = Friendship::Database.new
friends.have_any_friends? #=> false
friends.add_friend('Peter', :male, 28)
friends.have_any_friends? #=> true
```

We should be able to go through all of our friends using `each`.
We also need all the methods from `Enumerable`.

Example:

```ruby
friends = Friendship::Database.new
friends.add_friend('Peter', :male, 28)
friends.add_friend('Maria', :female, 25)

friend_names = friends.map(&:name)
puts friend_names # => ['Peter', 'Maria']
```

Of course you should return an `Enumerator` if a block isn't given.


```ruby
friends = Friendship::Database.new
friends.add_friend('Peter', :male, 28)
friends.add_friend('Maria', :female, 25)

friends_names = friends.each.map(&:name)

puts friend_names # => ['Peter', 'Maria']
```

Our `Database` should implement a find function.

Some examples how you should use the `find` function.

```ruby
friends = Friendship::Database.new
friends.add_friend('Peter', :male, 28)
friends.add_friend('Maria', :female, 25)
friends.add_friend('Denis', :male, 18)

# Returns an array of all of our friends called 'Peter'
friends.find(name: 'Peter')

# Returns all of our :female friends
friends.find(sex: :female)

# Returns all of our friends older than 20 and male)
friends.find(filter: ->(friend) { friend.male? && friend.age > 20 }
```

We should be able to `unfriend` our friends once we stop liking them.  
`unfriend` should work like find.



```ruby
friends = Friendship::Database.new
friends.add_friend('Peter', :male, 28)
friends.add_friend('Maria', :female, 25)
friends.add_friend('Denis', :male, 18)

puts friends.map(&:name) #=>  ['Peter', 'Maria', 'Denis']

friends.unfriend(name: 'Denis')
puts friends.map(&:name) #=> ['Peter', 'Maria']

puts friends.unfriend(sex: :male)
puts friends.map(&:name) #=> ['Maria']

puts friends.unfriend(filter: ->(friend) { friend.age == 25 })
puts friends.have_any_friends? #=> false
```
