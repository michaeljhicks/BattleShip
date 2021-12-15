require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'


class Battleship
  attr_reader :greeting, :game_play

    def initialize
      # @turn = Turn.new
      @player_board = Board.new
      @comp_board = Board.new
      @computer = Computer.new(@comp_board)
      @player = Player.new(@player_board)
      @cruiser = Ship.new('cruiser', 3)
      @submarine = Ship.new('submarine', 2)
      # ideally, we wanted to initialize @turn = Turn.new which removes the need to require above lines 13 - 18
    end


    def greeting

      # puts ```                         __________         __    __  .__           _________.__    .__
      #     #   /\|\/\     /\|\/\     /\|\/\   \______   \_____ _/  |__/  |_|  |   ____  /   _____/|  |__ |__|_____    /\|\/\     /\|\/\     /\|\/\
      #     #  _)    (__  _)    (__  _)    (__  |    |  _/\__  \\   __\   __\  | _/ __ \ \_____  \ |  |  \|  \____ \  _)    (__  _)    (__  _)    (__
      #     #  \_     _/  \_     _/  \_     _/  |    |   \ / __ \|  |  |  | |  |_\  ___/ /        \|   Y  \  |  |_> > \_     _/  \_     _/  \_     _/
      #     #    )    \     )    \     )    \   |______  /(____  /__|  |__| |____/\___  >_______  /|___|  /__|   __/    )    \     )    \     )    \
      #     #    \/\|\/     \/\|\/     \/\|\/          \/      \/                     \/        \/      \/   |__|       \/\|\/     \/\|\/     \/\|\/   ```
      #

      puts "Welcome to BATTLESHIP\n" +
        "Enter p to play. Enter q to quit."
        answer = gets.chomp
      if answer == 'p'
        puts "Let's play!"
        game_play
      else answer == 'q'
        puts "Okay bye!"
      end
    end

    def game_play #set up boards, player Computer
      @computer.place_cruiser # computer sets up board
      @computer.place_submarine
      @player.ship_placement
      show_boards # show_boards # player sets up board
      # loop until game over
        # calls player shot method
        # calls player takes shot method
        # calls computer shot method
          # insert @win_criteria method (from below)
          # this is all looped until game over.....break
      # if break from loops occurs, yields return message "congratulations, you've won" ...OR...
        # "Our sincerest condolences; the computer has won"
    end

    def show_boards
      p "=============COMPUTER BOARD============="
      puts @computer.comp_board.render      
      p "==============PLAYER BOARD=============="
      puts @player.player_board.render(true)
      puts
      puts "Take your shot! Enter a coordinate you wish to \n" +
      "fire upon!"

    end

    def win_criteria
      # if a players cruiser and sub are sunk = loss
      # if both computers ships are sunk = win

    end








end










      # computer takes first turn
        # turn confirmed: H, M, S
    # turn changes to player
      # player takes first turn
        # turn confirmed: H, M, S

    # all above: LOOP
      # loop until submarine + cruiser are sunk XXX
        # upon one side fully sunk, game then determines winner/loser....then game over

    #ask computer and person if ships are sunk, while loop
    #how to store turn state



#
#
#
#
#
# class BattleShip
#   attr_reader :turn
#
#
#   def initialize
#     @turn = Turn.new
#   end
#
#   def game_menu
#
#
#
#
#     p "Welcome to the world of BattleShip! Enter 'p' to play....if you dare! If you're scared and want to play checkers with Aunt Susan, enter 'Q'."
#     player_start = gets.chomp
#     if player_start = 'p'
#       puts "Game on, Chump!"#reference player.rb file for start of game / placing board
#     else
#       puts "Too bad, looks like you need to toughen up anyway!" # close out game / quit session
#     end
#   end
#
#   def game_begin
#     @turn.computer.place_cruiser
#     @turn.computer.place_submarine
#     @turn.player.ship_placement
#     until winning? do
#       @turn.turn_prompt
#       @turn.shot_call
#       @turn.shoot_at_player
#   end
#
#   end_game
#   end
#
#   def winning?
#     @turn.player.cruiser.sunk? == true && @turn.player.submarine.sunk? == true || @turn.computer.cruiser.sunk? == true && @turn.computer.submarine.sunk? == true
#   end
#
#   def end_game
#     if @turn.player.cruiser.sunk? == true && @turn.player.submarine.sunk? == true
#       puts "The computer won! Play again soon!"
#     else @turn.computer.cruiser.sunk? == true && @turn.computer.submarine.sunk? == true
#       puts "You won! You now reign as King of the Computers. J/k this is a mod 1 project.. so congrats on that."
#     end
#   new_game
#   end
#
#
# def new_game
#   battleship_2 = Battleship.new
#   battleship_2.greeting
# end
#
# #Dani Flash_Card Gameplay ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~``
#
# # require 'pry'
# # require './lib/deck'
# # require './lib/round'
# # require './lib/turn'
# # require './lib/card_generator'
#
# # class FlashCardGame
# #   def initialize(file)
# #     @cards = CardGenerator.new(file).cards
# #     @deck = Deck.new(@cards)
# #     @round = Round.new(@deck)
# #   end
# #
# #   def start
# #     welcome
# #     rounds
# #     end_game
# #   end
# #
# #   def welcome
# #     puts "Welcome! You're playing with #{@cards.length} cards."
# #     puts "-----------------------"
# #   end
# #
# #   def rounds
# #     until @round.deck.count < @round.count do
# #       puts "This is card number #{@round.count} out of #{@cards.length}."
# #       puts "Question: #{@round.current_card.question}"
# #       guess = gets.chomp
# #       turn = @round.take_turn(guess)
# #       puts turn.feedback
# #     end
# #   end
# #
# #   def end_game
# #     puts "****** Game over! ******"
# #     puts "You had #{@round.number_correct} correct guesses out of #{@cards.length} for a total score of #{@round.percent_correct}%."
# #     @round.deck.categories.each do |category|
# #       puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
# #     end
# #   end
# # end
