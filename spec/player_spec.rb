require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'

RSpec.describe Player do

  context 'Iteration III' do

    let(:board) {Board.new}
    let(:player) {Player.new(board)}

    describe 'Player' do

      it 'exists' do
        expect(player).to be_a(Player)
      end

    end

    describe 'has ships' do

      it 'exists' do
        expect(player.cruiser).to be_a(Ship)
        expect(player.submarine).to be_a(Ship)
      end
      
    end
  end
end
