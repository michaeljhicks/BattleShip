#Iteration 1 - Ships and Cells

##Test Driven Development
  In this iteration, you are required to use TDD to   create your classes. Use the interaction pattern to   determine what a method should do and write one or   more tests to verify that expected behavior. Then you   can implement the method. You should always write code   with the purpose of making a test pass.

##Ship
  A Ship object will represent a single ship on the board. It will be able to keep track of how much health it has, take hits, and report if it is sunk or not. A ship should start off with health equal to it’s length.

  The Ship class should follow this interaction pattern:

```ruby
pry(main)> require './lib/ship'
#=> true

pry(main)> cruiser = Ship.new("Cruiser", 3)
#=> #<Ship:0x00007feb05112d10...>

pry(main)> cruiser.name
#=> "Cruiser"

pry(main)> cruiser.length
#=> 3

pry(main)> cruiser.health
#=> 3

pry(main)> cruiser.sunk?
#=> false

pry(main)> cruiser.hit

pry(main)> cruiser.health
#=> 2

pry(main)> cruiser.hit

pry(main)> cruiser.health
#=> 1

pry(main)> cruiser.sunk?
#=> false

pry(main)> cruiser.hit

pry(main)> cruiser.sunk?
#=> true

```

##Cell
  A Cell object is a single cell on our board. A Cell can either contain a Ship or nothing.

```ruby
pry(main)> require './lib/ship'
# => true

pry(main)> require './lib/cell'
# => true

pry(main)> cell = Cell.new("B4")
# => #<Cell:0x00007f84f0ad4720...>

pry(main)> cell.coordinate
# => "B4"

pry(main)> cell.ship
# => nil

pry(main)> cell.empty?
# => true

pry(main)> cruiser = Ship.new("Cruiser", 3)
# => #<Ship:0x00007f84f0891238...>

pry(main)> cell.place_ship(cruiser)

pry(main)> cell.ship
# => #<Ship:0x00007f84f0891238...>

pry(main)> cell.empty?
# => false
```

###Additionally, a cell knows when it has been fired upon. When it is fired upon, the cell’s ship should be damaged if it has one:

```ruby
pry(main)> require './lib/ship'
# => true

pry(main)> require './lib/cell'
# => true

pry(main)> cell = Cell.new("B4")
# => #<Cell:0x00007f84f0ad4720...>

pry(main)> cruiser = Ship.new("Cruiser", 3)
# => #<Ship:0x00007f84f0891238...>

pry(main)> cell.place_ship(cruiser)

pry(main)> cell.fired_upon?
# => false

pry(main)> cell.fire_upon

pry(main)> cell.ship.health
# => 2

pry(main)> cell.fired_upon?
# => true
```


###Finally, a Cell will have a method called render which returns a String representation of the Cell for when we need to print the board. A cell can potentially be rendered as:

  *”.” if the cell has not been fired upon.
  *“M” if the cell has been fired upon and it does not contain a ship (the shot was a miss).
  *“H” if the cell has been fired upon and it contains a ship (the shot was a hit).
  *“X” if the cell has been fired upon and its ship has been sunk.

###Additionally, we will include an optional boolean argument to indicate if we want to reveal a ship in the cell even if it has not been fired upon. This should render a cell that has not been fired upon and contains a ship as an “S”. This will be useful for showing the user where they placed their ships and for debugging.

```ruby
pry(main)> cell_1 = Cell.new("B4")
# => #<Cell:0x00007f84f11df920...>

pry(main)> cell_1.render
# => "."

pry(main)> cell_1.fire_upon

pry(main)> cell_1.render
# => "M"

pry(main)> cell_2 = Cell.new("C3")
# => #<Cell:0x00007f84f0b29d10...>

pry(main)> cruiser = Ship.new("Cruiser", 3)
# => #<Ship:0x00007f84f0ad4fb8...>

pry(main)> cell_2.place_ship(cruiser)

pry(main)> cell_2.render
# => "."

# Indicate that we want to show a ship with the optional argument
pry(main)> cell_2.render(true)
# => "S"

pry(main)> cell_2.fire_upon

pry(main)> cell_2.render
# => "H"

pry(main)> cruiser.sunk?
# => false

pry(main)> cruiser.hit

pry(main)> cruiser.hit

pry(main)> cruiser.sunk?
# => true

pry(main)> cell_2.render
# => "X"
```

#Iteration 2 - The Board


##Test Driven Development
  In this iteration, you are required to use TDD to create your classes. Use the interaction pattern to determine what a method should do and write one or more tests to verify that expected behavior. Then you can implement the method. You should always write code with the purpose of making a test pass.

##Board
  The Board class is responsible for keeping track of cells, validating coordinates, validating ship placements, placing ships, and rendering a visual representation of itself.

###The Cells
  The board is responsible for keeping track of all the cells. Since our board is 4 x 4, it will have 16 Cell objects. It will keep track of these cells in a hash where the coordinates of the cell are the keys that point to Cell objects:

```ruby
pry(main)> require './lib/board' ....x
# => true

pry(main)> board = Board.new ....x
# => #<Board:0x00007ff0728c8010...>

pry(main)> board.cells ....x
# =>
{
 "A1" => #<Cell:0x00007ff0728a3f58...>,
 "A2" => #<Cell:0x00007ff0728a3ee0...>,
 "A3" => #<Cell:0x00007ff0728a3e68...>,
 "A4" => #<Cell:0x00007ff0728a3df0...>,
 "B1" => #<Cell:0x00007ff0728a3d78...>,
 "B2" => #<Cell:0x00007ff0728a3d00...>,
 "B3" => #<Cell:0x00007ff0728a3c88...>,
 "B4" => #<Cell:0x00007ff0728a3c10...>,
 "C1" => #<Cell:0x00007ff0728a3b98...>,
 "C2" => #<Cell:0x00007ff0728a3b20...>,
 "C3" => #<Cell:0x00007ff0728a3aa8...>,
 "C4" => #<Cell:0x00007ff0728a3a30...>,
 "D1" => #<Cell:0x00007ff0728a39b8...>,
 "D2" => #<Cell:0x00007ff0728a3940...>,
 "D3" => #<Cell:0x00007ff0728a38c8...>,
 "D4" => #<Cell:0x00007ff0728a3850...>
}
```

  Testing the #cells method is a bit tricky because the Cell objects are created in the Board class and not in our tests. We can’t specify exactly what the return value should be because we don’t have reference to the exact cell objects we expect in the hash. Instead, we can assert what we do know about this hash. It’s a hash, it should have 16 key/value pairs, and those keys point to cell objects.

###Validating Coordinates
  Our board should be able to tell us if a coordinate is on the board or not:

```ruby
pry(main)> board.valid_coordinate?("A1")....x
# => true

pry(main)> board.valid_coordinate?("D4")....x
# => true

pry(main)> board.valid_coordinate?("A5")....x
# => false

pry(main)> board.valid_coordinate?("E1")....x
# => false

pry(main)> board.valid_coordinate?("A22")....x
# => false
```

##Validating Placements
  Additionally, a Board should be able to tell us if a placement for a ship is valid or not. Our Board should have a method called valid_placement? that takes two arguments: a Ship object and an array of Coordinates.

  There are many things we need to check for validating ship placement. Let’s use this setup:

```ruby
pry(main)> require './lib/board'
# => true

pry(main)> require './lib/ship'
# => true

pry(main)> board = Board.new....x
# => #<Board:0x00007fcb0d9db478...>

pry(main)> cruiser = Ship.new("Cruiser", 3)....x
# => #<Ship:0x00007fcb0d989510...>

pry(main)> submarine = Ship.new("Submarine", 2)    ....x
# => #<Ship:0x00007fcb0e8402c0...>
```

  First, the number of coordinates in the array should be the same as the length of the ship:

```ruby
pry(main)> board.valid_placement?(cruiser, ["A1", "A2"])....x
# => false

pry(main)> board.valid_placement?(submarine, ["A2", "A3", "A4"])....x
# => false
```

  Next, make sure the coordinates are consecutive:

```ruby
pry(main)> board.valid_placement?(cruiser, ["A1", "A2", "A4"])....x
# => false

pry(main)> board.valid_placement?(submarine, ["A1", "C1"])....x
# => false

pry(main)> board.valid_placement?(cruiser, ["A3", "A2", "A1"])....x
# => false

pry(main)> board.valid_placement?(submarine, ["C1", "B1"])....x
# => false
```

  *****Finally, coordinates can’t be diagonal:******

```ruby
pry(main)> board.valid_placement?(cruiser, ["A1", "B2", "C3"]).....x
# => false

pry(main)> board.valid_placement?(submarine, ["C2", "D3"]).....x
# => false
```

  If all the previous checks pass then the placement should be valid:

```ruby
pry(main)> board.valid_placement?(submarine, ["A1", "A2"]).....x
# => true

pry(main)> board.valid_placement?(cruiser, ["B1", "C1", "D1"]).....x
# => true
```

  Note that all of the different cases listed above should be their own tests. This will help you break this problem down into small steps and working on them one at a time. You should not have one big test for validating placement.

##Tools for validation
  There are many ways to go about the validation. Here are some ideas to help you get started:

###Ranges

  Ruby has a built in Class called Range. It has a special syntax:

```ruby
pry(main)> range = 3..8
# => 3..8

pry(main)> range.class
# => Range
```

  The first element (in this case 3) is the start of the range and the second is the end of the range.

  You can turn a Range into an Array quite easily and then do Array stuff:

```ruby
pry(main)> range = 3..8
# => 3..8

pry(main)> array = range.to_a
# => [3, 4, 5, 6, 7, 8]

pry(main)> array.length
# => 6

pry(main)> array[3]
# => 6
```

  This also works with Strings:

```ruby
pry(main)> range = "A".."D"
# => "A".."D"

pry(main)> range.to_a
# => ["A", "B", "C", "D"]
```

###Ordinal Values
  The Range with Strings works because each character has an implicit value that tells us in what order the characters should be. This is called the Ordinal Value, and you can access it with the ord method for Strings:

```ruby
pry(main)> "A".ord
# => 65

pry(main)> "D".ord
# => 68
```

###Helpful Enumerables
  Ruby has an enumerable method called each_cons that allows you to access consecutive elements in a collection. See the Ruby Docs for more details.

  Also consider if the enumerables any?, all?, none? would be helpful.

###Placing Ships
  The board should be able to place a ship in its cells. Because a Ship occupies more than one cell, multiple Cells will contain the same ship. This is a little brain bendy at first, but it is a very important concept. This is Object Oriented Programming in a nutshell.

```ruby
pry(main)> require './lib/board'
# => true

pry(main)> require './lib/ship'
# => true

pry(main)> board = Board.new....x
# => #<Board:0x00007fcb0e1f6720...>

pry(main)> cruiser = Ship.new("Cruiser", 3)....x    
# => #<Ship:0x00007fcb0e1ffa28...>

pry(main)> board.place(cruiser, ["A1", "A2", "A3"])....x    

pry(main)> cell_1 = board.cells["A1"].....x    
# => #<Cell:0x00007fcb0e1f66a8...>

pry(main)> cell_2 = board.cells["A2"].....x
# => #<Cell:0x00007fcb0e1f6630...>

pry(main)> cell_3 = board.cells["A3"].....x    
# => #<Cell:0x00007fcb0e1f65b8...>

pry(main)> cell_1.ship
# => #<Ship:0x00007fcb0e1ffa28...>

pry(main)> cell_2.ship
# => #<Ship:0x00007fcb0e1ffa28...>

pry(main)> cell_3.ship
# => #<Ship:0x00007fcb0e1ffa28...>

pry(main)> cell_3.ship == cell_2.ship
# => true
```

##Overlapping Ships
  When you are able to place ships, you need to add another check to your validation of ship placements so that ships don’t overlap:

```ruby
pry(main)> require './lib/board'
# => true

pry(main)> require './lib/ship'
# => true

pry(main)> board = Board.new
# => #<Board:0x00007fcb0e1f6720...>

pry(main)> cruiser = Ship.new("Cruiser", 3)
# => #<Ship:0x00007fcb0d92b5f0...>

pry(main)> board.place(cruiser, ["A1", "A2", "A3"])

pry(main)> submarine = Ship.new("Submarine", 2)    
# => #<Ship:0x00007fcb0dace9c0...>

pry(main)> board.valid_placement?(submarine, ["A1", "B1"])....x
# => false
```

##Rendering the Board
  Our board needs to be able to render a String representation of itself to display to the user all of its cells in a formatted grid. Each Cell should be displayed using the rules from Iteration 1:

  ”.” if the cell has not been fired upon.
  “M” if the cell has been fired upon and it does not contain a ship (the shot was a miss).
  “H” if the cell has been fired upon and it contains a ship (the shot was a hit).
  “X” if the cell has been fired upon and its ship has been sunk. Note that all of the cells that contain that sunken ship should render as an “X”, not just the cell that resulted in the ship being sunk.
  And just like with cells, we will include an optional argument to indicate whether we want to show hidden ships.

```ruby
pry(main)> require './lib/board'
# => true

pry(main)> require './lib/ship'
# => true

pry(main)> board = Board.new
# => #<Board:0x00007fcb0f056860...>

pry(main)> cruiser = Ship.new("Cruiser", 3)    
# => #<Ship:0x00007fcb0f0573f0...>

pry(main)> board.place(cruiser, ["A1", "A2", "A3"])    

pry(main)> board.render
# => "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"

pry(main)> board.render(true)
# => "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
```

  You can format strings on multiple lines using concatenation to make them more readable. The two return values from above can be written as:

```ruby
"  1 2 3 4 \n" +
"A . . . . \n" +
"B . . . . \n" +
"C . . . . \n" +
"D . . . . \n"

"  1 2 3 4 \n" +
"A S S S . \n" +
"B . . . . \n" +
"C . . . . \n" +
"D . . . . \n"
```

  As you move forward, you will need to add functionality to your game so that you can fire on Cells and damage their Ships. When you do this, you should also add new tests for your render method that it can render with Hits, Misses, and Sunken Ships. A Board in the middle of a game might be rendered as something like this:

```ruby
"  1 2 3 4 \n" +
"A H . . . \n" +
"B . . . M \n" +
"C X . . . \n" +
"D X . . . \n"

"  1 2 3 4 \n" +
"A H S S . \n" +
"B . . . M \n" +
"C X . . . \n" +
"D X . . . \n"
```
