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

    it "moves a rook to a new legal postion" do
      game = Game.new
      game.move("a2", "a4")
      expect(game.move("A1", "a3")).to eql([[" ", " ", "♜", "♟︎", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a rook to a new legal postion" do
      game = Game.new
      game.move("a2", "a4")
      game.move("A1", "a3")
      expect(game.move("A3", "g3")).to eql([[" ", " ", " ", "♟︎", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", "♜", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a rook to a new legal postion" do
      game = Game.new
      game.move("a2", "a4")
      game.move("A1", "a3")
      game.move("A3", "g3")
      game.move("g3", "g6")
      game.move("g6", "c6")
      game.move("c6", "c3")
      expect(game.move("C3", "a3")).to eql([[" ", " ", "♜", "♟︎", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a rook to a new legal postion" do
      game = Game.new
      game.move("h2", "h4")
      game.move("B7", "b6")
      game.move("H1", "h3")
      game.move("B6", "b5")
      game.move("h3", "b3")
      game.move("b5", "b4")
      expect(game.move("b3", "b4")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", "♜", " ", " ", " ", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            [" ", " ", " ", "♟︎", " ", " ", "♙", "♖"]])
    end

    it "moves a rook to a new legal postion" do
      game = Game.new
      game.move("a2", "a4")
      game.move("H7", "h5")
      game.move("f2", "f3")
      game.move("H8", "h6")
      game.move("f3", "f4")
      game.move("h6", "g6")
      game.move("a1", "a3")
      game.move("g6", "g4")
      game.move("a3", "f3")
      expect(game.move("g4", "f4")).to eql([[" ", " ", " ", "♟︎", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", " ", "♜", "♖", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", "♙", " ", " ", " "]])
    end

    it "doesn't move a rook to an illegal position" do
      game = Game.new
      game.move("a2", "a4")
      game.move("a1", "A3")
      expect(game.move("a3", "b4")).to eql("illegal move")
    end

    it "doesn't move a rook to an illegal position" do
      game = Game.new
      expect(game.move("a1", "a4")).to eql("illegal move")
    end

    it "doesn't move a rook to an illegal position" do
      game = Game.new
      game.move("a2", "a4")
      game.move("a1", "a3")
      expect(game.move("a3", "A6")).to eql("illegal move")
    end

    it "doesn't move a rook to an illegal position" do
      game = Game.new
      game.move("a2", "a4")
      game.move("c7", "c6")
      game.move("a1", "a3")
      game.move("c6", "c5")
      game.move("a3", "b3")
      game.move("c5", "c4")
      game.move("b3", "b4")
      game.move("a7", "a5")
      expect(game.move("b4", "e4")).to eql("illegal move")
    end

    it "doesn't move a rook to an illegal position" do
      game = Game.new
      game.move("a2", "a4")
      game.move("b7", "b6")
      game.move("a1", "a3")
      game.move("b6", "b5")
      game.move("a3", "c3")
      game.move("b5", "b4")
      game.move("c3", "c4")
      game.move("a7", "a6")
      expect(game.move("c4", "a4")).to eql("illegal move")
    end
  end
end