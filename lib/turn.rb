require 'pry'
require './lib/board'

class Turn
  attr_reader :computer,
              :player_selection,
              :comp_sunk_ships,
              :player_sunk_ships

  def initialize(computer, player_selection)
    @computer = computer #already handled on both Computer + Player classes
    @player_selection = player_selection
    @comp_sunk_ships = 0
    @player_sunk_ships = 0
  end

  # show the boards
  def show_boards
    p "=============COMPUTER BOARD============="
    p @computer.board.render
    p "==============PLAYER BOARD=============="
    p @player_selection.board.render(true)
  end

  # prompt player shot coordinates
  # report player shot result
  def player_shot(player_choice)
    loop do
      if player_choice != []
        if computer.board.valid_coordinate?(player_choice)
          if computer.board.cells[player_choice].fired_upon? == false
            @computer.board.cells[player_choice].fire_upon
            if computer.board.cells[player_choice].render(true) == "M"
              puts "Your shot on #{player_choice} was a miss."
            elsif computer.board.cells[player_choice].render(true) == "H"
              puts "Your shot on #{player_choice} was a hit."
            elsif computer.board.cells[player_choice].render(true) == "X"
              puts "Your shot on #{player_choice} sunk a ship."
              @comp_ships_sunk += 1
            end
            break
          end
        elsif computer.board.valid_coordinate?(player_choice) == false
          puts "Invalid coordinate! Try again:"
          break
        end
      end
    end
  end

  # prompt computer shot coordinates
  # report computer shot result

  def comp_shot
      computer_choice = player_selection.board.cells.keys.sample
      until player_selection.board.valid_coordinate?(computer_choice) && player_selection.board.cells[computer_choice].fired_upon? == false
        computer_choice = player_selection.board.cells.keys.sample
      end
      @player_selection.board.cells[computer_choice].fire_upon
      if player_selection.board.cells[computer_choice].render(true) == "M"
        puts "Computer's fire on #{computer_choice} was a miss."
      elsif player_selection.board.cells[computer_choice].render(true) == "H"
        puts "Computer's fire on #{computer_choice} was a hit."
      elsif player_selection.board.cells[computer_choice].render(true) == "X"
        puts "Computer's fire on #{computer_choice} sunk a ship."
        @player_sunk_ships += 1
      end
    end

end
