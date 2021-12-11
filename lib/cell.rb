class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
    end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if empty? == false
      @ship.hit
    end
    @fired_upon = true
  end

  def render(ship = false)
    if ship == true && empty? == false
      "S"
    elsif empty? == false && @fired_upon == true && @ship.sunk?
      "X"
    elsif empty? == false && @fired_upon == true
      "H"
    elsif @fired_upon == true && empty? == true
      "M"
    else
      "."

    end

  end
end
