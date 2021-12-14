require './lib/ship'
require './lib/cell'
require './lib/turn'
require './lib/player'
require './lib/computer'

computer = Computer.new
person = Player.new
battleship = BattleShip.new(computer, person)
battleship.start
