require './lib/chess'

describe Board do
  describe "#create_board" do
    it "creates a nested array to keep track of each position on the board" do
      board = Board.new
      expect(board.create_board).to eql([["♖", "♙", "", "", "", "", "♟︎", "♜"],
                                         ["♘", "♙", "", "", "", "", "♟︎", "♞"],
                                         ["♗", "♙", "", "", "", "", "♟︎", "♝"],
                                         ["♕", "♙", "", "", "", "", "♟︎", "♛"],
                                         ["♔", "♙", "", "", "", "", "♟︎", "♚"],
                                         ["♗", "♙", "", "", "", "", "♟︎", "♝"],
                                         ["♘", "♙", "", "", "", "", "♟︎", "♞"],
                                         ["♖", "♙", "", "", "", "", "♟︎", "♜"]])
    end
  end
end