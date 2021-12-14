require 'pry'
require './lib/computer'

class Player

  attr_reader :player_board,
              :cruiser,
              :submarine

  def initialize(board)
    @player_board = board
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
  end
  def player_places_ships
    puts  "I have laid out my ships on the grid\n" +
          "You now need to lay out your two ships.\n" +
          "The Cruiser is three units long and the \n" +
          "Submarine is two units long."
    puts @player_board.render

    puts  "Enter the squares for the Cruiser one at a time, \n" +
          "for a total of 3 spaces:"

    loop do
      input = gets.chomp
      cruiser_coords = input.split(",")
      cruiser_coords = cruiser_coords.map do |coordinate|
        coordinate.strip()
      end
      if @player_board.valid_placement?(cruiser, cruiser_coords)
        @player_board.place(cruiser, cruiser_coords)
        break
      end
      puts "Those are invalid coordinates. Please try again:"
    end

    puts "Now let's place the Submarine.\n" +
    "It has 2 cells. Please enter them one at a time."
    puts @player_board.render(true)
    loop do
      input = gets.chomp
      submarine_coords = input.split(",")
      submarine_coords = submarine_coords.map do |coordinate|
        coordinate.strip()
      end
      if @player_board.valid_placement?(submarine, submarine_coords)
        @player_board.place(submarine, submarine_coords)
        break
      end
      puts "Those are invalid coordinates. Please try again:"
    end
    puts "Here is your board"
    `say "Lets play!"`
    puts @player_board.render(true)
  end

end
