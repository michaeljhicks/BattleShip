require 'pry'
require './lib/cell'
require './lib/ship'

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
    numbers = coordinates.map {|coordinate| coordinate[1].to_i}
    overlapping = coordinates.map {|coordinate| @cells[coordinate].empty?}
    if coordinates.length != ship.length
      return false
    elsif overlapping.include?(false) == true
      false
    elsif letters.uniq.length == 1 && (numbers.min..numbers.max).to_a == numbers
      true #if letters are the same (AAA) and the numbers are sequential( 123)
    elsif (letters.min..letters.max).to_a == letters && numbers.uniq.length == 1
      true #if letters are and sequential (A,B,C) and numbers are the same (111): true
    elsif (letters.min..letters.max).to_a == letters && (numbers.min..numbers.max).to_a == numbers
      false #if letters are sequntial (ABC) and numbers are squential (123) false
    elsif letters.uniq.length == 1 && numbers.uniq.length == 1
      false #if letters the same (AAA) and numbers the same (111) false
    else
       false
    end
  end

    def place(ship, coordinates)
      coordinates.map do |coordinate|
      @cells[coordinate].place_ship(ship)

    end

    def render(start_ship = false)
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(start_ship)} #{@cells["A2"].render(start_ship)} #{@cells["A3"].render(start_ship)} #{@cells["A4"].render(start_ship)} \n" +
      "B #{@cells["B1"].render(start_ship)} #{@cells["B2"].render(start_ship)} #{@cells["B3"].render(start_ship)} #{@cells["B4"].render(start_ship)} \n" +
      "C #{@cells["C1"].render(start_ship)} #{@cells["C2"].render(start_ship)} #{@cells["C3"].render(start_ship)} #{@cells["C4"].render(start_ship)} \n" +
      "D #{@cells["D1"].render(start_ship)} #{@cells["D2"].render(start_ship)} #{@cells["D3"].render(start_ship)} #{@cells["D4"].render(start_ship)} \n"
    end

  end

end
