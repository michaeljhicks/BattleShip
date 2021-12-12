require './lib/ship'
require './lib/cell'
require './lib/turn'
require './lib/player'
require './lib/computer'


RSpec.describe Player do
  context 'Iteration III' do

    let(:player) {Player.new("")}

    describe 'Player' do
      it 'exists' do

        expect(player).to be_a(Player)
      end
    end
  end
end
