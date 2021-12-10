require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  context 'Iteration I Cell' do

    let(:cell) {Cell.new("B4")}

    describe 'Iteration I' do
      it 'exists' do

        expect(cell).to be_a(Cell)
      end
      it 'has cordinates' do

        expect(cell.coordinate).to eq("B4")
      end

      it 'has a ship' do

        expect(cell.ship).to eq(nil)
      end

      it 'is an empty cell' do

      expect(cell.empty?).to eq(true)
      end

      it 'can have a ship' do
        cruiser = Ship.new("Cruiser", 3)

        cell.place_ship(cruiser)
        expect(cell.empty?).to eq(false)
         expect(cell.ship).to eq(cruiser)
      end

    describe '#fire_upon and #fired_upon?' do
        it 'defaults non-fired upon...' do
          cell = Cell.new("B4")
          expect(cell.fired_upon?).to eq(false)
        end

        it 'can be fired upon' do
          cell = Cell.new("B4")
          cruiser = Ship.new("Cruiser", 3)

          cell.place_ship(cruiser)
          # require 'pry' ; binding.pry


          expect(cell.fired_upon?).to be(false)
        end

        xit 'can lower ship health' do
          cell = Cell.new("B4")
          cruiser = Ship.new("Cruiser", 3)

          cell.place_ship(cruiser)
          # require 'pry' ; binding.pry

          cell.fire_upon

          expect(cell.ship.health).to be(2)
          expect(cell.fired_upon?).to be(true)
        end
      end
    end
  end
end
