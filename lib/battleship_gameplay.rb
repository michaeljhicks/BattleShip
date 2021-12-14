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
    # @comp_player = computer
    # @person_player = player
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
      return Computer.new

    # system "clear"

    puts "I have laid out my ships on the grid."
    # sleep(1.0)
    puts "You now need to lay out your two ships."
    # sleep(1.0)
    puts "The Cruiser is three units long and the Submarine is two units long."

    # sleep(1.0)
    puts "#{@comp_board.render}\n" + "Enter the squares for the Cruiser (3 spaces):"
    return player_setup_cruiser #calls
    puts "#{@player_board.render(true)}\n" + "Enter the squares for the Submarine (2 spaces):"
    return player_setup_sub
    new_turn
    puts "Game Over!"
    end
  end



    # def player_setup_sub
    #   submarine = Ship.new("Submarine", 2)
    #   loop do
    #     player_selection = gets.chomp
    #     submarine_coordinates = player_selection.split(",")
    #     submarine_coordinates = submarine_coordinates.map do |coordinate|
    #       coordinate.strip()
    #     end
    #     if @player_board.valid_placement?(submarine, submarine_coordinates)
    #       @player_board.place(submarine, submarine_coordinates)
    #       break
    #     end
    #     puts "Those are invalid coordinates. Please try again:"
    #   end
    # end

    def new_turn
      system 'clear'
      turn = Turn.new(comp_player, person_player)
      turn.comp_shot
      # sleep(0.8)
      puts "=============COMPUTER BOARD============="
      puts "#{@comp_board.render}"
      puts "==============PLAYER BOARD=============="
      puts "#{@player_board.render(true)}"
      puts "Enter coordinate to fire upon"
      player_choice = gets.chomp
      turn.player_shot(player_choice)
      # sleep(0.8)
      if @comp_player.has_lost?
        puts "=============COMPUTER BOARD============="
        puts "#{@comp_board.render}"
        puts "==============PLAYER BOARD=============="
        puts "#{@player_board.render(true)}"
        p "You won!"
        # sleep(5.0)
        self.start
      elsif @person_player.has_lost?
        puts "=============COMPUTER BOARD============="
        puts "#{@comp_board.render}"
        puts "==============PLAYER BOARD=============="
        puts "#{@player_board.render(true)}"
        p "Computer won!"
        # sleep(5.0)
        self.start
      else
        new_turn
      end
    end

    # def comp_setup_ships
    #   comp_cruiser = Ship.new("Cruiser", 3)
    #   comp_submarine = Ship.new("Submarine", 2)
    #   loop do
    #     cruiser_coordinates = []
    #     until cruiser_coordinates.length == comp_cruiser.length do
    #       cruiser_coordinates << @comp_board.cells.keys.sample
    #     end
    #     if @comp_board.valid_placement?(comp_cruiser, cruiser_coordinates)
    #       @comp_board.place(comp_cruiser, cruiser_coordinates)
    #       break
    #     end
    #   end
    #   loop do
    #     submarine_coordinates = []
    #     until submarine_coordinates.length == comp_submarine.length do
    #       submarine_coordinates << @comp_board.cells.keys.sample
    #     end
    #     if @comp_board.valid_placement?(comp_submarine, submarine_coordinates)
    #       @comp_board.place(comp_submarine, submarine_coordinates)
    #       break
    #     end
    #   end
    # end


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
