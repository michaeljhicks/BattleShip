require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/turn'
require './lib/player'
require './lib/computer'


class BattleShip
  attr_reader :comp_player,
              :person_player,
              :comp_sunk_ships,
              :player_sunk_ships

  def initialize(computer, player)
    @comp_player = computer
    @person_player = player
    @comp_sunk_ships = 0
    @player_sunk_ships = 0
    @comp_board = @comp_player.board
    @player_board = @player_person.board
  end

  def main_menu
    # system "clear"
    puts "                                  __________         __    __  .__           _________.__    .__ "
    puts "   /\|\/\     /\|\/\     /\|\/\   \______   \_____ _/  |__/  |_|  |   ____  /   _____/|  |__ |__|_____    /\|\/\     /\|\/\     /\|\/\   "
    puts "  _)    (__  _)    (__  _)    (__  |    |  _/\__  \\   __\   __\  | _/ __ \ \_____  \ |  |  \|  \____ \  _)    (__  _)    (__  _)    (__ "
    puts "  \_     _/  \_     _/  \_     _/  |    |   \ / __ \|  |  |  | |  |_\  ___/ /        \|   Y  \  |  |_> > \_     _/  \_     _/  \_     _/ "
    puts "    )    \     )    \     )    \   |______  /(____  /__|  |__| |____/\___  >_______  /|___|  /__|   __/    )    \     )    \     )    \ "
    puts "    \/\|\/     \/\|\/     \/\|\/          \/      \/                     \/        \/      \/   |__|       \/\|\/     \/\|\/     \/\|\/ "

    p "Welcome to the world of BattleShip!"
    # sleep(1.0)
    puts "Enter 'p' to play....if you dare! Or if you're foundering and reluctant to set sail into deeper waters, then go play Pickle Ball with Aunt Susan and enter 'q'."

    player_start = gets.chomp
    if player_start == 'p' || player_start == 'P' # capture both lower and upper case answers
      return comp_setup_ships

    # system "clear"

    puts "I have laid out my ships on the grid."
    # sleep(1.0)
    puts "You now need to lay out your two ships."
    # sleep(1.0)
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts ""
    # sleep(1.0)
    puts "#{@comp_board.render}\n" + "Enter the squares for the Cruiser (3 spaces):"

    return player_setup_cruiser

    puts "#{@player_board.render(true)}\n" + "Enter the squares for the Submarine (2 spaces):"
    return player_setup_sub
    new_turn
    puts "Game Over!"
    end
  end






end






#     player_start = gets.chomp
#     if player_start == 'P' || player_start == 'p'
#       puts "Game on, Chump!"#reference player.rb file for start of game / placing board
#     else
#       puts "Too bad, looks like you need to toughen up anyway!" # close out game / quit session
#     end
#   end
#
#
#   def game_begin
#     computer.place_ships
#     player
#     #here, the computer places the cruiser and the sub
#     #then the player places the crusier and the sub
#
#   end
#
#   #evalutes shot
#   #display hit,miss, sunk
#
#   def game_end
#     #when both players ships are sunk - OR - both computers ships are sunk
#
#   end
#
#   def play_again
#     #restart another game or quit
#
#   end
# end
