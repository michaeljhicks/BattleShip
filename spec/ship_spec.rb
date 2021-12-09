require './lib/ship'

RSpec.describe Ship do
  context 'Iteration I Ship' do

    let(:cruiser) {Ship.new("Cruiser", 3)}

    describe 'Iteration I' do
      it 'exist' do

        expect(cruiser).to be_a(Ship)
      end

      it 'has a name' do

        expect(cruiser.name).to eq("Cruiser")
      end

      it 'has a length' do

        expect(cruiser.length).to eq(3)
      end

      it 'has health' do

        expect(cruiser.health).to eq(3)
      end

      it 'is sunk?' do

        expect(cruiser.sunk?).to eq(false)
      end

      it 'gets hit' do

        expect(cruiser.health).to eq(2)
      end

      it 'gets hit again' do

        expect(cruiser.health).to eq(1)
      end

      it 'is sunk?' do

        expect(cruiser.sunk?).to eq(false)
      end

      it 'gets hit again' do

        expect(cruiser.health).to eq(0)
      end

      it 'is sunk?' do

        expect(cruiser.sunk?).to eq(true)
      end
    end
  end
end
