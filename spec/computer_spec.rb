require './lib/ship'
require './lib/cell'
require './lib/turn'
require './lib/player'
require './lib/computer'


RSpec.describe Computer do
  context 'Iteration III' do

    let(:computer) {Computer.new("")}

    describe 'Computer' do
      it 'exists' do

        expect(computer).to be_a(Computer)
      end
    end
  end
end
