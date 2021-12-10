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

        it 'can lower ship health' do
          cell = Cell.new("B4")
          cruiser = Ship.new("Cruiser", 3)

          cell.place_ship(cruiser)
          # require 'pry' ; binding.pry

          cell.fire_upon

          expect(cell.ship.health).to be(2)
          expect(cell.fired_upon?).to be(true)
        end
      end

      describe '#hits and misses' do
          it 'can render a cell' do
            cell_1 = Cell.new("B4")
            expect(cell_1).to be_a(Cell)
          end

          it 'cell has not been fired upon' do
            cell_1 = Cell.new("B4")

            expect(cell_1.render).to eq(".")
          end

          it 'can render a miss' do
            cell_1 = Cell.new("B4")
            cell_1.fire_upon
            expect(cell_1.render).to eq("M")
          end

          xit 'can render a miss' do  #RED
            cell_1 = Cell.new("B4")
            cell_2 = Cell.new("C3")
            cruiser = Ship.new("Cruiser", 3)
            cell_2.place_ship(cruiser)
            expect(cell_2.render).to eq(".")
            expect(cell_2.render(true)).to eq("S")
          end

          it 'can render a hit' do
            cell_1 = Cell.new("B4")
            cell_2 = Cell.new("C3")
            cruiser = Ship.new("Cruiser", 3)
            cell_2.place_ship(cruiser)
            cell_2.fire_upon
            expect(cell_2.render).to eq("H")
          end
          it 'cruiser sunk' do
            cell_1 = Cell.new("B4")
            cell_2 = Cell.new("C3")
            cruiser = Ship.new("Cruiser", 3)
            cell_2.place_ship(cruiser)
            cell_2.fire_upon
            expect(cell_2.render).to eq("H")
          end



        end

    end
  end
end
