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

  def player_shot #here, we have everything to render
    loop do
      player_choice = gets.chomp.upcase
      if @computer.comp_board.valid_coordinate(player_choice) == true
        if @computer.comp_board.cells(player_choice).fired_upon? == true
          puts "You've already taken this shot. Please try again."
          #return back to player choice to retrieve a new/accurate selection
          # if coordinate is valid, take the shot
            # capture + redirect, and account for invalid coordinates entered
        end
      end
    end

  def player_takes_shot(player_choice) # where we're determining if player has sunk and/or hit ship
      # reference the fire_upon? method in Cell Class
        #if cell.empty? == false
          # puts "hit on ship"
        # if shot hits the cell + sunk? method == true.....then "you sunk their ship!"
          #else puts "missed shot!"
  end

  def computer_shot
    loop do
      computer_choice = @computer.merge_select
        if @player.player_board.cells(computer_choice).fired_upon? == true
          # return back to computer for its next choice
          if cell.empty? == false
            # computer scored a 'hit'
            # if shot hits the cell + sunk? method == true.....then "computer sunk your ship!"
            if cell.empty? == true
              # computer missed
          #return back to player choice to retrieve a new/accurate selection
          # if coordinate is valid, take the shot
            # capture + redirect, and account for invalid coordinates entered
        end
      end
    end
  end
  # prompt player shot coordinates
  # report player shot result
