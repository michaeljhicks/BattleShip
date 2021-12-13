class Turn
  attr_reader

  def initialize(argument)
    @argument = argument
  end


# display the boards
# prompt player shot coordinates
# prompt computer shot coordinates
# report player shot result
# report computer shot result

end


# FROM DANI~~~~~~~~~~~~~~~~~~~~~~~~~~~

class Turn
  attr_reader :card,
              :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    guess == card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end



# CARD GENERATOR~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# require './lib/card'
#
# class CardGenerator
#   def initialize(filename)
#     @filename = filename
#   end
#
#   def cards
#     IO.readlines(@filename, chomp: true).map do |line|
#       card_info = line.split(',')
#       question = card_info[0]
#       answer = card_info[1]
#       category = card_info[2]
#       Card.new(question, answer, category)
#     end
#   end
# end



#
