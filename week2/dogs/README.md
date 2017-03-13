# Overview
As every other Ruby programmer, we have to write animal classes in order to save the animal kingdom.


## Dog Class
Our dog class should be initialized with a name, an owner, a boolean whether it bites and it's dog years.

For an example
`dog = Dog.new('Sharo', 'Stamat', false, 14)`

Our dog should be able to give us it's name.
`#name`, which returns the name of the dog

Also, our dog can tell us the name of it's `#owner`.
The dog can also change it's owner with the method `#owner=`.

We can also ask our dog whether it has the same owner as another dog. (`foxy.same_owner? freddie`)

As every other dog, we can ask it whether it bites with the method `#bites?`.

Part of the life of every dog is to grow old.
That means that we should be able to get `#dog_years` and set `#dog_years=` of our pets.
Since we don't like maths, we should be able to ask the dog how old it is in human years with the method `#to_human_years`. (Remember, one human year is seven dog years).

When our dogs are bored they can `#bark` and `#bark!`.
Here the subtle difference is that `#bark!` is more dangerous than simple `#bark`ing.
What does that mean?
The method `#bark` should just return us `"Bark! Bark!"`.
While the method `#bark` should return the same, but also change the mood of our dog, so that `dog#bites?` return `true`.

We have to be able to compare different dogs since there are so many of them. (`#==`)
We say that two dogs are the same if both have the same name, the same owner and the same years.



Here's an example of how our class should look in the end, you can use it (:

```ruby
class Dog
  def initialize(name, owner, bites, years)
  end

  def name
  end

  def owner
  end

  def owner=(other)
  end

  def dog_years
  end

  def dog_years=(other)
  end

  def bites?
  end

  def bark
  end

  def bark!
  end

  def to_human_years
  end

  def ==(dog)
  end

  def same_owner?(dog)
  end
end
```
