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

  describe "#letter_to_number_position" do
    it "converts a position for use in an array" do
      game = Game.new
      expect(game.letter_to_number_position("A2")).to eql([0,1])
    end

    it "converts a position for use in an array" do
      game = Game.new
      expect(game.letter_to_number_position("b1")).to eql([1,0])
    end

    it "excludes invaild inputs" do
      game = Game.new
      expect(game.letter_to_number_position("z1")).to eql("invaild position")
    end
  end

  describe "#move" do
    it "moves a pawn to a new legal postion" do
      game = Game.new
      expect(game.move("a2", "a3")).to eql([["♜", " ", "♟︎", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a pawn to a new legal postion" do
      game = Game.new
      expect(game.move("D2", "d4")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", " ", " ", "♟︎", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a pawn to a new legal postion" do
      game = Game.new
      game.move("a2", "a4")
      game.move("b7", "b5")
      expect(game.move("A4", "B5")).to eql([["♜", " ", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", "♟︎", " ", " ", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "doesn't move a pawn to an illegal position" do
      game = Game.new
      expect(game.move("c2", "D3")).to eql("illegal move")
    end

    it "doesn't move a pawn to an illegal position" do
      game = Game.new
      game.move("f2", "F3")
      expect(game.move("f3", "f5")).to eql("illegal move")
    end

    it "doesn't move a pawn to an illegal position" do
      game = Game.new
      game.move("H2", "H3")
      expect(game.move("h3", "h5")).to eql("illegal move")
    end
  end
end