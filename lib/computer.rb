require './lib/board'

class Computer

  attr_reader :cruiser_placement
              :sub_placement

def initialize(argument)
  @argument = argument
end

def cruiser_placement
board.place
board.valid_placement
  random
# choose from range abcd to 1234

#for cruiser
  #choice to pick AAA 123, ABC 111 etc, length 3
#for submarine
  #choice to pick AAA 123, ABC 111 etc, length 2
end

def sub_placement
  board.place
  board.valid_placement
    random
  # choose from range abcd to 1234
  #draw from the array and select elements random and compare against valid?
end

def comuter_turn
# computer sets its board
#computer needs to take a turn
#expect plenty of valid_placement pull throughs

end
