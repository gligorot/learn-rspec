require "tictactoe_rspec"

describe Board do
  let(:game) {Board.new("p1", "p2")}

  describe "#initialize" do

    it "has initiated two players correctly" do
      expect(game.instance_variable_get(:@one).color).to eql("X")
      expect(game.instance_variable_get(:@two).color).to eql("O")
    end

  end

  describe "#set_cell" do

    it "sets the correct move in the correct place" do
      game.set_cell(0, 0, "X")
      corner = game.instance_variable_get(:@board)[0][0]
      expect(corner.symbol).to eql("X")
    end
  end

  describe "#print_board" do
    context "with no moves made" do
      it "prints only '_' " do
        expect{game.print_board}.to output("_ _ _\n_ _ _\n_ _ _\n").to_stdout
      end
    end
    context "with a move made " do
      it "prints board with X and O" do
        game.set_cell(0, 1, "X")
        game.set_cell(1, 1, "O")
        expect{game.print_board}.to output("_ X _\n_ O _\n_ _ _\n").to_stdout
      end
    end
  end

  describe "#check_full" do
    it "raises an error if a cell is already filled" do
      game.set_cell(0, 0, "X")
      expect{game.check_full(0, 0)}.to raise_error(ArgumentError)
    end

    it "doesn't raise an error if a cell is empty" do
      game.set_cell(0, 0, "X")
      expect{game.check_full(0, 1)}.not_to raise_error
    end
  end

  describe "#draw_check" do
    it "returns true if after 9 moves there is no winner" do
      game.set_cell(0,0, "X") #1
      game.set_cell(0,1, "O") #2
      game.set_cell(0,2, "X") #3
      game.set_cell(1,1, "O") #5
      game.set_cell(1,0, "X") #4
      game.set_cell(2,0, "O") #7
      game.set_cell(1,2, "X") #6
      game.set_cell(2,2, "O") #9
      game.set_cell(2,1, "X") #8

      expect(game.draw_check).to be true
    end

    it "returns false on less than 9 moves" do
      game.set_cell(0,0, "X") #1
      game.set_cell(0,1, "O") #2
      game.set_cell(0,2, "X") #3

      expect(game.draw_check).to be false
    end
  end

  describe "#win_check" do
    it "returns true if there is a winning combo on the board" do
      game.set_cell(0,0, "X") #1
      game.set_cell(0,1, "X") #2
      game.set_cell(0,2, "X") #3

      expect(game.win_check).to be true
    end

    it "returns false if there is no winning combo on the board" do
      game.set_cell(0,0, "X") #1
      game.set_cell(0,1, "O") #2
      game.set_cell(0,2, "X") #3

      expect(game.win_check).to be false
    end
  end
=begin
  describe "#draw_check" do
    before {@move_array = [1,2,3,4,5,6,7,8,9]}
    context "before 9 moves" do
      it "draw_check returns false" do

        #3 moves in first row
        @move_array[0..2].each do |move|
          row, col = game.get_move(move)
          game.set_cell(row, col, game.instance_variable_get(:@one).color)
          game.switch_players
        end

        expect(game.draw_check).to be false
      end
    end

    context "after 9th move" do
      it "draw_check returns true" do

        #all 9 moves
        @move_array.each do |move|
          row, col = game.get_move(move)
          game.set_cell(row, col, game.instance_variable_get(:@one).color)
          game.switch_players
        end

        expect(game.draw_check).to be true
      end
    end
  end
=end
end
