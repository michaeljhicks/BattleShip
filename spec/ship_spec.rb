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

      it 'losses health' do
        cruiser.hit
        expect(cruiser.health).to eq(2)
        cruiser.hit
        expect(cruiser.health).to eq(1)
        expect(cruiser.sunk?).to eq(false)
        cruiser.hit
        expect(cruiser.health).to eq(0)
        expect(cruiser.sunk?).to eq(true)
      end
    end
  end
end
