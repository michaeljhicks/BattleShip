require './lib/computer'

class Player

  attr_accessor :player_board, :cruiser, :submarine

  def initialize(board)
    @player_board = board
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
  end

  def ship_placement
    puts "I have laid out my ships on the grid\n" +
      "You now need to lay out your two ships.\n" +
      "The Cruiser is three units long and the \n" +
      "Submarine is two units long."
    puts @player_board.render
    puts "Enter the squares for the Cruiser one at a time, \n" +
    "for a total of 3 spaces:"

    loop do
      cruiser_coordinates = []
      @cruiser.length.times do
      coordinate = gets.chomp.upcase
        if @player_board.valid_coordinate?(coordinate) == false
          puts "That coordinate is invalid. Try again!"
          redo
        else
          cruiser_coordinates << coordinate
        end
      end

      if @player_board.valid_placement?(@cruiser, cruiser_coordinates) == false
        puts "Those coordinates are invalid. Please try again!"
      end
      if @player_board.valid_placement?(@cruiser, cruiser_coordinates) == true
        @player_board.place(@cruiser, cruiser_coordinates)
        break
      end
    end
    puts "Now let's place the Submarine.\n" +
    "It has 2 cells. Please enter them one at a time."
    puts @player_board.render(true)

    loop do
      submarine_coordinates = []
      @submarine.length.times do
        coordinate = gets.chomp.upcase
          if @player_board.valid_coordinate?(coordinate) == false
            puts "That coordinate is invalid. Try again!"
            redo
          else
            submarine_coordinates << coordinate
          end
      end

      if @player_board.valid_placement?(@submarine, submarine_coordinates) == false
        puts "Those coordinates are invalid. Please try again!"
      end
      if @player_board.valid_placement?(@submarine, submarine_coordinates) == true
        @player_board.place(@submarine, submarine_coordinates)
        break
      end
    end
    puts "Here is your board"
    `say "Lets play!"`
    puts @player_board.render(true)
    puts '### THE TITANIC CALLED ###'
  end
end
