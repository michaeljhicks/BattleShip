


def empty

end

def place_ship(ship)

end

def fired_upon?

end

def fire_upon

end
pry(main)> cruiser = Ship.new("Cruiser", 3)
#=> #<Ship:0x00007feb05112d10...>

pry(main)> cruiser.name
#=> "Cruiser"

pry(main)> cruiser.length
#=> 3

pry(main)> cruiser.health
#=> 3

pry(main)> cruiser.sunk?
