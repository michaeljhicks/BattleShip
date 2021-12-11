require 'pry'

class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
      }

  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    letters = coordinates.map {|coordinate| coordinate[0]}
    numbers = coordinates.map {|coordinate| coordinate[1]}.to_s

    # numbers.each_cons(3).to_a
    def four_consecutive?(numbers)
      return false unless numbers.size == ship.length
      numbers.each_cons(2).all? {|a, b| b == a + 1 }
    end
    # binding.pry
    if coordinates.length != ship.length
      return false

    else
      return true
    end

    def place(ship, coordinates)


    end

    def render

    end
    # letters = []
    # numbers = []

  end
end
