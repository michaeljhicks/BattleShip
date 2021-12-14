require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/turn'
require './lib/player'
require 'pry'
# require './lib/computer'


RSpec.describe Turn do
  context 'Iteration III' do

    let(:turn) {Turn.new("comp_selection", "player_selection")}

    describe 'Turn' do
      it 'exists' do

        expect(turn).to be_a(Turn)
        # binding.pry
      end
    end
  end
end
