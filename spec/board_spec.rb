require './lib/board'
require './lib/ship'
require './lib/cell'


RSpec.describe Board do
  context 'Iteration II' do

    let(:board) {Board.new}
    let(:cruiser) {Ship.new("Cruiser", 3)}
    let(:submarine) {Ship.new("Submarine", 2)}

    describe 'board' do
      it 'exists' do

        expect(board).to be_a(Board)
      end

      it 'has cells' do

        expect(board.cells).to be_a(Hash)
      end

      it 'has valid coordinates' do

        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("A5")).to eq(false)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
      end

      it 'cruiser has valid placement' do #green

        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      end

      it 'submarine has valid placement' do

        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
      end
      # it 'submarine has valid placement' do
      #
      #   expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
      # end

      it 'cruiser has consecutive coordinates I' do

        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      end

      it 'submarine has consecutive coordinates I' do

        expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      end

      it 'cruiser has consecutive coordinates II' do

        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      end

      it 'submarine has consecutive coordinates II' do

        expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
      end
    end



    describe "Coordinates can't be diagonal" do #RED

      it "cruiser valid? " do

        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      end

      it "submarine valid? " do #RED

        expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)

      end

    describe "coordinates are valid!" do #RED

      it "submarine valid placement" do #RED

        expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      end

      it "cruiser valid placement" do #RED

        expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
      end

    end

    describe "Placing Ships" do
      it 'exists' do

        expect(board).to be_a(Board)
      end

      it "ship exists" do

        expect(cruiser = Ship.new("Cruiser", 3)).to be_a(Ship)

      end

      it "places a ship" do

        board.place(cruiser, ["A1", "A2", "A3"])
        expect(cell_1 = board.cells["A1"]).to be_a(Cell)
        expect(cell_2 = board.cells["A2"]).to be_a(Cell)
        expect(cell_3 = board.cells["A3"]).to be_a(Cell)
      end

      it "cell occupied by ship" do
        board.place(cruiser, ["A1", "A2", "A3"])
        cell_1 = board.cells["A1"]
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]


        expect(cell_1.ship).to be_a(Ship)
        expect(cell_2.ship).to be_a(Ship)
        expect(cell_3.ship).to be_a(Ship)

      end

      it "is the same ship" do
        board.place(cruiser, ["A1", "A2", "A3"])
        cell_1 = board.cells["A1"]
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]

        expect(cell_3.ship == cell_2.ship).to eq(true)

      end



    end

    describe "overlapping ships" do
      it 'exists' do

        expect(board).to be_a(Board)
      end

      it "ship exists" do

        expect(cruiser = Ship.new("Cruiser", 3)).to be_a(Ship)

      end

      it "placing a cruiser" do
        board.place(cruiser, ["A1", "A2", "A3"])
        expect(submarine = Ship.new("Submarine", 2)).to be_a(Ship)
        expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
      end


    end

    describe "render the board" do
      it 'exists' do

        expect(board).to be_a(Board)
      end

      it "ship exists" do

        expect(cruiser = Ship.new("Cruiser", 3)).to be_a(Ship)

      end

      xit "placing a cruiser" do
        board.place(cruiser, ["A1", "A2", "A3"])
        board.render
        board.render(true)
      end
    end


    end
  end
end
