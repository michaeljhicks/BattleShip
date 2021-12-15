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

      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" +
          "   ____    _  _____ _____ _     _____ ____  _   _ ___ ____\n" +
          "  | __ )  / ||_   _|_   _| |   | ____/ ___|| | | |_ _|  _  \n" +
          "  |  _   / _|  | |   | | | |   |  _|  ___  | |_| || || |_) |\n" +
          "  | |_) / __|  | |   | | | |___| |___ ___) |  _  || ||  __/\n" +
          "  |____/_/  |  |_|   |_| |_____|_____|____/|_| |_|___|_|\n" +
          "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


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
