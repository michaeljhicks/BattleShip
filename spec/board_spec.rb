require './lib/board'
require './lib/ship'


RSpec.describe Board do
  context 'Iteration II Board' do

    let(:board) {Board.new}
    let(:cruiser) {Ship.new("Cruiser", 3)}
    let(:cruiser) {Ship.new("Submarine", 2)}

    describe 'board' do
      it 'exists' do

        expect(board).to be_a(Board)
      end

      it 'has cells' do

        expect(board.cells).to be_a(Hash)
      end

      xit 'has valid coordinates' do

        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("A5")).to eq(false)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
      end

      it 'cruiser has valid placement' do

        expect(board.valid_placement?(cruiser, ["A1", "A2"])). to eq(false)
      end

      it 'submarine has valid placement' do

        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"]). to eq(false)
      end

      it 'cruiser has consecutive coordinates I' do

        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"]). to eq(false)
      end

      it 'submarine has consecutive coordinates I' do

        expect(board.valid_placement?(submarine, ["A1", "C1"]). to eq(false)
      end

      it 'cruiser has consecutive coordinates II' do

        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"]). to eq(false)
      end

      it 'submarine has consecutive coordinates II' do

        expect(board.valid_placement?(submarine, ["C1", "B1"]). to eq(false)
      end


    end
  end
end
