class Player

  attr_reader

  def initialize(board)
    @player_board = board
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
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

class Player

  attr_reader :player_board,
              :cruiser,
              :submarine

  def initialize(board)
    @player_board = board
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
  end

  def select_letter
    letter = ("A".."D").to_a
    letter.sample
  end

  def select_number
    number = ("1".."4").to_a
    number.sample
  end

  def merge_select
    select_letter + select_number
  end


  def place_cruiser
    loop do
      cruiser_coordinates = []
      @cruiser.length.times do
        cruiser_coordinates << merge_select
      end
      cruiser_coordinates.sort
      if @player_board.valid_placement?(@cruiser, cruiser_coordinates) == true
        @player_board.place(@cruiser, cruiser_coordinates)
        break
      end
    end
  end

  def place_submarine
    loop do
      submarine_coordinates = []
      @submarine.length.times do
        submarine_coordinates << merge_select
      end
      submarine_coordinates.sort
      if @player_board.valid_placement?(@submarine, submarine_coordinates) == true
        @player_board.place(@submarine, submarine_coordinates)
        break
      end
    end
  end
end
