# Rock, Paper, Scissors, Lizard, Spock

Ruby programmers often waste their time with games.  
My friends at slack told me that I can't beat them at rock, paper, scissors, lizard, spock (RPSLS in short).  
I really want to beat them, but I can't be bothered with learning the rules of the game.
So you have to help me beat them by writing the game in ruby.  

In short:

  * Scissors cuts Paper
  * Paper covers Rock
  * Rock crushes Lizard
  * Lizard poisons Spock
  * Spock smashes Scissors
  * Scissors decapitates Lizard
  * Lizard eats Paper
  * Paper disproves Spock
  * Spock vaporizes Rock
  * (and as it always has) Rock crushes Scissors

[You can find more on the game here.](http://bigbangtheory.wikia.com/wiki/Rock_Paper_Scissors_Lizard_Spock)

Write a class `RockPaperScissors`.  

The class should take one parameter in the constructor, a symbol of the choice of the player.
Valid choices would be `:lizard`, `:spock`, `:rock`, `:scissors`, `:paper`.

This class should implement all these methods: `<, <=, ==, >, >=`.  
These methods should return whether a player defeats another player.


```ruby
pesho = RockPaperScissors.new(:lizard)
stamat = RockPaperScissors.new(:spock)
pesho > stamat
=> true
pesho < stamat
=> false
```

