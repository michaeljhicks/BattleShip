class Player

  attr_reader

  def initialize(argument)
    @argument = argument
  end

  def place_ships
  board.place
  board.valid_placement

  #for cruiser
    #choice to pick AAA 123, ABC 111 etc, length 3
  #for submarine
    #choice to pick AAA 123, ABC 111 etc, length 2
  end

# player sets up board
# player interacts with command line
# player takes turns

end
