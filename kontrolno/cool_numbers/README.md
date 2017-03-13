# Cool Numbers

As ruby programmers, we often rank things and have the need
to bother others with our opinions.

For an example:

  * The `1st` day of the week is boring.
  * Chocolate ice cream is `2nd` best after vanilla.

As ruby programmers, we are too lazy for thinking how to convert a number into an ordinal. That's why we will make Ruby help us with that.


Create a function called `cool_numbers` which will take one number and give us it's ordinal string counterpart.


```ruby
cool_numbers(1)     # => "1st"
cool_numbers(2)     # => "2nd"
cool_numbers(1002)  # => "1002nd"
cool_numbers(1003)  # => "1003rd"
cool_numbers(-11)   # => "-11th"
cool_numbers(-1021) # => "-1021st"
```

Rules to converting to ordinal numbers:

  * Add `th` to the number.
  * Exceptions are `1st`, `2nd`, `3rd`, `21st`, `22nd`, `23rd`, ...
