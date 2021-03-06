require 'pry'
class Ship

  attr_reader :name,
              :length,
              :health
              :hit

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  def sunk?
    if @health > 0
      @sunk = false
    elsif @health == 0
      @sunk = true
    elsif @health < 0
      @sunk = true
    end
  end
  
  def hit
    if @health > 0
      @health -= 1
    end
  end

end
