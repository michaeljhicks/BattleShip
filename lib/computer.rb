require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/turn'
require './lib/player'
require './lib/computer'
require './lib/board'
require './lib/battleship_gameplay'

class Computer

  attr_reader :comp_board,
              :cruiser,
              :submarine

  def initialize(board)
    @comp_board = board
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
      if @comp_board.valid_placement?(@cruiser, cruiser_coordinates) == true
        @comp_board.place(@cruiser, cruiser_coordinates)
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
      if @comp_board.valid_placement?(@submarine, submarine_coordinates) == true
        @comp_board.place(@submarine, submarine_coordinates)
        break
      end
    end
  end
end




#Hicks brilliant idea that needs to be sent back to the factory and repurposed

@cruiser_placement = [
  ["A1", "A2", "A3"], #valid vertical placements
  ["A2", "A3", "A4"],
  ["B1", "B2", "B3"],
  ["B2", "B3", "B4"],
  ["C1", "C2", "C3"],
  ["C2", "C3", "C4"],
  ["D1", "D2", "D3"],
  ["D2", "D3", "D4"],

  ["A1", "B1", "C1"], #valid horizontal placements
  ["B1", "C1", "D1"],
  ["A2", "B2", "C2"],
  ["B2", "C2", "D2"],
  ["A3", "B3", "C3"],
  ["B3", "C3", "D3"],
  ["A4", "B4", "C4"],
  ["B4", "C4", "D4"]
]
