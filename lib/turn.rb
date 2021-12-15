require 'pry'

class Turn
  attr_reader :player_board,
              :comp_board,
              :computer,
              :player,
              :show_boards

  def initialize
    @player_board = Board.new
    @comp_board = Board.new
    @computer = Computer.new(@computer_board)
    @player = Player.new(@player_board)
    @show_boards = show_boards
  end

  # show the boards
  def show_boards
    p "=============COMPUTER BOARD============="
    p @computer.board.render
    p "==============PLAYER BOARD=============="
    p @player.board.render(true)
    puts "Take your shot! Enter a coordinate you wish to \n" +
    "fire upon!"

  end
  # prompt player shot coordinates
  # report player shot result
