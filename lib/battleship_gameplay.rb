require './lib/ship.rb'
require './lib/cell.rb'
require './lib/turn.rb'
require './lib/player.rb'
require './lib/computer.rb'

class BattleShip

  def initialize(argument)
    @argument = argument
  end

  def game_menu

    puts ```                         __________         __    __  .__           _________.__    .__
      /\|\/\     /\|\/\     /\|\/\   \______   \_____ _/  |__/  |_|  |   ____  /   _____/|  |__ |__|_____    /\|\/\     /\|\/\     /\|\/\
     _)    (__  _)    (__  _)    (__  |    |  _/\__  \\   __\   __\  | _/ __ \ \_____  \ |  |  \|  \____ \  _)    (__  _)    (__  _)    (__
     \_     _/  \_     _/  \_     _/  |    |   \ / __ \|  |  |  | |  |_\  ___/ /        \|   Y  \  |  |_> > \_     _/  \_     _/  \_     _/
       )    \     )    \     )    \   |______  /(____  /__|  |__| |____/\___  >_______  /|___|  /__|   __/    )    \     )    \     )    \
       \/\|\/     \/\|\/     \/\|\/          \/      \/                     \/        \/      \/   |__|       \/\|\/     \/\|\/     \/\|\/   ```



    p "Welcome to the world of BattleShip! Enter 'P' to play....if you dare! If you're scared and want to play checkers with Aunt Susan, enter 'Q'."
    player_start = gets.chomp
    if player_start = 'P'
      puts "Game on, Chump!"#reference player.rb file for start of game / placing board
    else
      puts "Too bad, looks like you need to toughen up anyway!" # close out game / quit session
    end
  end

  def game_begin
    computer.place_ships
    player
    #here, the computer places the cruiser and the sub
    #then the player places the crusier and the sub

  end

  #evalutes shot
  #display hit,miss, sunk

  def game_end
    #when both players ships are sunk - OR - both computers ships are sunk

  end

  def play_again
    #restart another game or quit

  end
end


#Dani Flash_Card Gameplay ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~``

# require 'pry'
# require './lib/deck'
# require './lib/round'
# require './lib/turn'
# require './lib/card_generator'

# class FlashCardGame
#   def initialize(file)
#     @cards = CardGenerator.new(file).cards
#     @deck = Deck.new(@cards)
#     @round = Round.new(@deck)
#   end
#
#   def start
#     welcome
#     rounds
#     end_game
#   end
#
#   def welcome
#     puts "Welcome! You're playing with #{@cards.length} cards."
#     puts "-----------------------"
#   end
#
#   def rounds
#     until @round.deck.count < @round.count do
#       puts "This is card number #{@round.count} out of #{@cards.length}."
#       puts "Question: #{@round.current_card.question}"
#       guess = gets.chomp
#       turn = @round.take_turn(guess)
#       puts turn.feedback
#     end
#   end
#
#   def end_game
#     puts "****** Game over! ******"
#     puts "You had #{@round.number_correct} correct guesses out of #{@cards.length} for a total score of #{@round.percent_correct}%."
#     @round.deck.categories.each do |category|
#       puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
#     end
#   end
# end
