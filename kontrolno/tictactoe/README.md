# TicTacToe

We will implement good ol' TicTacToe.
When we are bored, we often play TicTacToe with our programmer friends.
In order to increase our odds of winning, we will write our own TacTacToe.

Example:

```ruby
board = TicTacToe::Board.new([['x', 'o', 'x'],
                              ['o', 'x', 'o'],
                              ['x', 'o', 'x']])
```

Create a `winner` method, which will return who the winner is or `nil` if no one is a winner.


```ruby
board.winner #=> "Player with 'x' is the winner."
```

or

```ruby
board.winner #=> nil
board.winner #=> "Player with 'o' is the winner."
```

And we need a final method, called `winning_moves`
`winning_moves` should return an array of arrays - the [x, y] coordinates of the winner's symbols.
If we call this method, and have no winner, it should return an empty array.

Example:

```ruby

board = TicTacToe::Board.new([['x', 'o', 'x'],
                              ['o', 'x', 'o'],
                              ['x', 'o', 'x']])
board.winning_moves #=> [[0, 0], [2, 0], [1, 1], [0, 2], [2, 2]]


board = TicTacToe::Board.new([['o', 'x', ' '],
                              ['o', ' ', 'x'],
                              ['o', ' ', ' ']])

board.winning_moves #=> [[0, 0], [1, 0], [2, 0]]
```
