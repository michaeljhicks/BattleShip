require './lib/battleship_gameplay'
require './lib/board'
require './lib/cell'
require './lib/computer'
require './lib/player'
require './lib/ship'
require './lib/turn'

def begin
  loop do
    game = BattleShip.new
  end
end


# computer = Computer.new
# person = Player.new
# battleship = BattleShip.new(computer, person)
# battleship.start
