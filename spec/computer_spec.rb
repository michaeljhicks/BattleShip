require './lib/ship'
require './lib/cell'
# require './lib/turn'
require './lib/player'
require './lib/computer'
require './lib/board'


RSpec.describe Computer do
  context 'Iteration III' do

    let(:board) {Board.new}
    let(:computer) {Computer.new(board)}

    describe 'Computer' do

      it 'exists' do
        expect(computer).to be_a(Computer)
      end

      it 'has ships' do
        expect(computer.cruiser).to be_a(Ship)
        expect(computer.submarine).to be_a(Ship)
      end

    end

    describe '#place_ship' do

      it 'can generate random letters' do
        computer.select_letter

        expect(computer.select_letter).to be_a(String)
      end

      it 'can generate random numbers' do
        expect(computer.select_number).to be_a(String)
      end

      it 'can combine random pick into a single string' do
        expect(computer.merge_select.length).to eq(2)
        expect(computer.merge_select).to be_a(String)
      end

      it 'can validate a combined_selection' do
        combined_selection = "A4"
        expect(computer.comp_board.valid_coordinate?(combined_selection)).to eq(true)
        combined_2 = "F5"
        expect(computer.comp_board.valid_coordinate?(combined_2)).to eq(false)
      end
    end

    describe '#place_ship' do

      it 'places a cruiser if successful coordinates generated' do
        computer.place_cruiser

        expect(board.cells.empty?).to eq(false)
      end

      it 'places a submarine if successful coordinates generated' do
        computer.place_submarine
        
        expect(board.cells.empty?).to eq(false)
      end
    end
  end
end
