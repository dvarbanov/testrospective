# Podcaster

In order to seem productive, ruby programmers listen to podcasts while commuting.
This is why we will create a podcast application.  

Create a class `Podcast`.

The `Podcast` class will hold all information and episodes about our episodes.
You should initialize a new `Podcast` with a name.

Example:

```ruby
cortex = Podcast.new('Cortex')
```

We should also have an `Episode` class for our podcasts.
An episode should have the following attributes:
  * id (more on that later)
  * name
  * description
  * minutes (an integer in minutes)

We would create a normal episode that we can use later like that:

```ruby
episode1 = Episode.new('Productivity', 'The first episode of Cortex, where we talk about being self-employed.', 80)
episode1.name # => 'Productivity'
episode1.description # => 'The first episode of Cortex, where we talk about being self-employed.'
episode1.minutes # => 80
```

We can add episodes to our Podcast using the `Podcast#<<` operator.  
At start episodes have a `nil` id.  
After you add them to a podcast they should get an id in the order they are being added.

```ruby
cortex = Podcast.new('Cortex')
episode1 = Episode.new('Productivity', 'The first episode of Cortex, where we talk about being self-employed.', 80)
episode2 = Episode.new('TodoLists', 'Managing your day by todos', 68)

episode1.id # => nil
episode2.id # => nil

cortex << episode1
cortex << episode2
episode1.id # => 1
episode2.id # => 2
```

We should be able to find episodes in our podcast by using the `find` method.
Find takes a hash.  
A single key-value pair.
The key will tell us whether we search the name or the description of the episodes.  
While the value for name will search for a substring in the name(the search term can be small letters, you should still find the correct episode). 
The value for description is a list of words that the description should include all.


Example:

```ruby
cortex = Podcast.new('Cortex')
episode1 = Episode.new('Productivity', 'The first episode of Cortex, where we talk about being self-employed.', 80)
episode2 = Episode.new('TodoLists', 'Managing your day by todos', 68)
episdoe3 = Episode.new('Schedule', 'We will talk about how to schedule your day', 73)

cortex << episode1
cortex << episode2
cortex << episode3

cortex.find(name: 'productivity') #=> [episode1]
cortex.find(name: 'od') #=> [episode1, episode2]
cortex.find(description: ['your', 'day']) #=> [episode2, episode3]
cortex.find(description: ['We', 'will', 'talk'] #=> [episode3]
```

Lastly, we should give our clients a nice way to view the podcast.  
Write a method called `info`. This method should return a nice view of our podcasts.  
It should list all of our episodes with a little information.
Everything should be separated with 10 `=` sings.

Example:

```ruby
cortex = Podcast.new('Cortex')
episode1 = Episode.new('Productivity', 'The first episode of Cortex, where we talk about being self-employed.', 80)
episode2 = Episode.new('TodoLists', 'Managing your day by todos.', 68)

cortex << episode1
cortex << episode2

cortex.info #=> 
"Podcast: Cortex
Total episodes: 2
Total duration: 148
==========
Episode 1
Name: Productivity
The first episode of Cortex, where we talk about being self-employed.
Duration: 80 minutes
==========
Episode 2
Name: TodoLists
Managing your day by todos.
Duration: 68 minutes"
```

Note: everything should be on a new line.
