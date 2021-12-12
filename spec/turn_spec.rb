require './lib/ship'
require './lib/cell'
require './lib/turn'
require './lib/player'
require './lib/computer'


RSpec.describe Turn do
  context 'Iteration III' do

    let(:turn) {Turn.new("")}

    describe 'Turn' do
      it 'exists' do

        expect(turn).to be_a(Turn)
      end
    end
  end
end
