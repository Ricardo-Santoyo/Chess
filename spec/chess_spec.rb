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

    it "doesn't move a pawn to an illegal position" do
      game = Game.new
      game.move("a2", "a4")
      game.move("a7", "a5")
      expect(game.move("a4", "a5")).to eql("illegal move")
    end

    it "doesn't move a pawn to an illegal position" do
      game = Game.new
      game.move("a2", "a4")
      game.move("f7", "f6")
      game.move("a4", "a5")
      expect(game.move("a7", "a5")).to eql("illegal move")
    end

    it "doesn't move a pawn to an illegal position" do
      game = Game.new
      game.move("h2", "h3")
      game.move("g2", "g4")
      expect(game.move("h3", "g4")).to eql("illegal move")
    end

    it "doesn't move a pawn to an illegal position" do
      game = Game.new
      game.move("d7", "d5")
      game.move("c7", "c6")
      expect(game.move("c6", "d5")).to eql("illegal move")
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

    it "doesn't move a rook to an illegal position" do
      game = Game.new
      game.move("a2", "a4")
      game.move("a1", "A3")
      expect(game.move("a3", "a4")).to eql("illegal move")
    end

    it "doesn't move a rook to an illegal position" do
      game = Game.new
      game.move("a7", "a5")
      game.move("b7", "b6")
      game.move("a8", "a6")
      expect(game.move("a6", "b6")).to eql("illegal move")
    end

    it "moves a knight to a new legal postion" do
      game = Game.new
      expect(game.move("b1", "c3")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            [" ", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", "♞", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a knight to a new legal postion" do
      game = Game.new
      game.move("b1", "c3")
      expect(game.move("c3", "A4")).to eql([["♜", "♟︎", " ", "♞", " ", " ", "♙", "♖"],
                                            [" ", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a knight to a new legal postion" do
      game = Game.new
      game.move("b1", "c3")
      game.move("b8", "c6")
      game.move("c3", "A4")
      game.move("c6", "a5")
      game.move("b2", "b3")
      expect(game.move("a5", "b3")).to eql([["♜", "♟︎", " ", "♞", " ", " ", "♙", "♖"],
                                            [" ", " ", "♘", " ", " ", " ", "♙", " "],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "doesn't move a knight to an illegal position" do
      game = Game.new
      expect(game.move("b1", "b4")).to eql("illegal move")
    end

    it "doesn't move a knight to an illegal position" do
      game = Game.new
      game.move("b1", "c3")
      expect(game.move("c3", "e5")).to eql("illegal move")
    end

    it "doesn't move a knight to an illegal position" do
      game = Game.new
      game.move("b1", "c3")
      game.move("c3", "A4")
      expect(game.move("a4", "b4")).to eql("illegal move")
    end

    it "doesn't move a knight to an illegal position" do
      game = Game.new
      game.move("c2", "c3")
      expect(game.move("b1", "c3")).to eql("illegal move")
    end

    it "doesn't move a knight to an illegal position" do
      game = Game.new
      game.move("f7", "f6")
      expect(game.move("g8", "f6")).to eql("illegal move")
    end

    it "moves a bishop to a new legal postion" do
      game = Game.new
      game.move("d2", "d3")
      expect(game.move("c1", "e3")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            [" ", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", " ", "♟︎", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", "♝", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a bishop to a new legal postion" do
      game = Game.new
      game.move("d2", "d3")
      game.move("c1", "e3")
      expect(game.move("e3", "d4")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            [" ", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", " ", "♟︎", "♝", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a bishop to a new legal postion" do
      game = Game.new
      game.move("d2", "d3")
      game.move("d7", "d5")
      game.move("c1", "e3")
      game.move("c8", "g4")
      game.move("e3", "d4")
      game.move("g4", "f3")
      expect(game.move("d4", "c5")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            [" ", "♟︎", " ", " ", "♝", " ", "♙", " "],
                                            ["♛", " ", "♟︎", " ", "♙", " ", " ", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", "♗", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a bishop to a new legal postion" do
      game = Game.new
      game.move("d2", "d3")
      game.move("d7", "d6")
      game.move("c1", "e3")
      game.move("c8", "g4")
      game.move("e3", "b6")
      expect(game.move("g4", "e2")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", "♝", "♙", "♘"],
                                            [" ", "♟︎", " ", " ", " ", " ", "♙", " "],
                                            ["♛", " ", "♟︎", " ", " ", "♙", " ", "♕"],
                                            ["♚", "♗", " ", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "doesn't move a bishop to an illegal position" do
      game = Game.new
      game.move("f2", "f4")
      expect(game.move("f1", "f3")).to eql("illegal move")
    end

    it "doesn't move a bishop to an illegal position" do
      game = Game.new
      game.move("d2", "d4")
      game.move("c1", "e3")
      expect(game.move("e3", "D3")).to eql("illegal move")
    end

    it "doesn't move a bishop to an illegal position" do
      game = Game.new
      expect(game.move("c1", "a3")).to eql("illegal move")
    end

    it "doesn't move a bishop to an illegal position" do
      game = Game.new
      game.move("d2", "d4")
      game.move("c1", "e3")
      expect(game.move("e3", "c5")).to eql("illegal move")
    end

    it "doesn't move a bishop to an illegal position" do
      game = Game.new
      game.move("d2", "d4")
      game.move("e2", "e3")
      expect(game.move("c1", "e3")).to eql("illegal move")
    end

    it "doesn't move a bishop to an illegal position" do
      game = Game.new
      game.move("e7", "e5")
      game.move("d7", "d6")
      expect(game.move("f8", "d6")).to eql("illegal move")
    end

    it "moves a queen to a new legal postion" do
      game = Game.new
      game.move("e2", "e3")
      expect(game.move("d1", "f3")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            [" ", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", " ", "♟︎", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", "♛", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a queen to a new legal postion" do
      game = Game.new
      game.move("e2", "e4")
      game.move("d2", "d3")
      game.move("d1", "d2")
      expect(game.move("d2", "e3")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            [" ", " ", "♟︎", " ", " ", " ", "♙", "♕"],
                                            ["♚", " ", "♛", "♟︎", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a queen to a new legal postion" do
      game = Game.new
      game.move("e2", "e4")
      game.move("d7", "d5")
      game.move("d2", "d3")
      game.move("d8", "d6")
      game.move("d1", "d2")
      game.move("d6", "e5")
      game.move("d2", "e3")
      game.move("e5", "f5")
      game.move("e3", "f3")
      expect(game.move("f5", "f3")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            [" ", " ", "♟︎", " ", "♙", " ", " ", " "],
                                            ["♚", " ", " ", "♟︎", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", "♕", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "doesn't move a queen to an illegal position" do
      game = Game.new
      expect(game.move("d8", "d6")).to eql("illegal move")
    end

    it "doesn't move a queen to an illegal position" do
      game = Game.new
      expect(game.move("d1", "f3")).to eql("illegal move")
    end

    it "doesn't move a queen to an illegal position" do
      game = Game.new
      game.move("d7", "d5")
      expect(game.move("d8", "c6")).to eql("illegal move")
    end

    it "moves a king to a new legal postion" do
      game = Game.new
      game.move("e7", "e6")
      expect(game.move("e8", "e7")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", "♟︎", " ", " ", " ", "♙", "♔", " "],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a king to a new legal postion" do
      game = Game.new
      game.move("e2", "e4")
      game.move("f7", "f6")
      game.move("d1", "h5")
      game.move("g7", "g5")
      game.move("h5", "h4")
      expect(game.move("e8", "f7")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            [" ", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            ["♚", " ", " ", "♟︎", " ", " ", "♙", " "],
                                            ["♝", "♟︎", " ", " ", " ", "♙", "♔", "♗"],
                                            ["♞", "♟︎", " ", " ", "♙", " ", " ", "♘"],
                                            ["♜", "♟︎", " ", "♛", " ", " ", "♙", "♖"]])
    end

    it "moves a king to a new legal postion" do
      game = Game.new
      game.move("f2", "f4")
      game.move("e7", "e5")
      game.move("e1", "f2")
      game.move("e5", "e4")
      game.move("f4", "f5")
      game.move("e4", "e3")
      expect(game.move("f2", "e3")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            [" ", "♟︎", "♚", " ", " ", " ", " ", "♔"],
                                            ["♝", " ", " ", " ", "♟︎", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "moves a king to a new legal postion" do
      game = Game.new
      game.move("e2", "e3")
      game.move("e1", "e2")
      game.move("e2", "d3")
      game.move("d3", "d4")
      game.move("d4", "e4")
      expect(game.move("e4", "f3")).to eql([["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♝", "♟︎", " ", " ", " ", " ", "♙", "♗"],
                                            ["♛", "♟︎", " ", " ", " ", " ", "♙", "♕"],
                                            [" ", " ", "♟︎", " ", " ", " ", "♙", "♔"],
                                            ["♝", "♟︎", "♚", " ", " ", " ", "♙", "♗"],
                                            ["♞", "♟︎", " ", " ", " ", " ", "♙", "♘"],
                                            ["♜", "♟︎", " ", " ", " ", " ", "♙", "♖"]])
    end

    it "doesn't move a king to an illegal position" do
      game = Game.new
      expect(game.move("e1", "e3")).to eql("illegal move")
    end

    it "doesn't move a king to an illegal position" do
      game = Game.new
      game.move("e2", "e3")
      game.move("e1", "e2")
      expect(game.move("e2", "g4")).to eql("illegal move")
    end
  end
end