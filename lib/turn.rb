require 'pry'

class Turn
  attr_reader :comp_selection,
              :player_selection,
              :comp_sunk_ships,
              :player_sunk_ships

  def initialize(comp_selection, player_selection)
    @comp_selection = comp_selection
    @player_selection = player_selection
    @comp_sunk_ships = 0
    @player_sunk_ships = 0
  end

  # display the boards
  def show_boards
    p "=============COMPUTER BOARD============="
    p @comp_selection.board.render
    p "==============PLAYER BOARD=============="
    p @player_selection.board.render(true)
    binding.pry
  end

  # prompt player shot coordinates
  # report player shot result
  def player_shot(player_choice)
    loop do
      if player_choice != []
        if comp_selection.board.valid_coordinate?(player_choice)
          if comp_selection.board.cells[player_choice].fired_upon? == false
            @comp_selection.board.cells[player_choice].fire_upon
            if comp_selection.board.cells[player_choice].render(true) == "M"
              puts "Your shot on #{player_choice} was a miss."
            elsif comp_selection.board.cells[player_choice].render(true) == "H"
              puts "Your shot on #{player_choice} was a hit."
            elsif comp_selection.board.cells[player_choice].render(true) == "X"
              puts "Your shot on #{player_choice} sunk a ship."
              @comp_ships_sunk += 1
            end
            break
          end
        elsif comp_selection.board.valid_coordinate?(player_choice) == false
          puts "Invalid coordinate! Try again:"
          break
        end
      end
    end
  end

  # prompt computer shot coordinates
  # report computer shot result


end
