require './lib/chess'

describe Game do
  describe "#create_board" do
    it "creates a nested array to keep track of each position on the board" do
      board = Game.new
      expect(board.create_board).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                         ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                         ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                         ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                         ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                         ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                         ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                         ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end
  end
end