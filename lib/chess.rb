module Board
  def create_board
    i = 0
    board = []
    8.times do
      column = []
      8.times do
        column << " "
      end
      board << column
    end
    board[0][7] = "♖"
    board[1][7] = "♘"
    board[2][7] = "♗"
    board[3][7] = "♕"
    board[4][7] = "♔"
    board[5][7] = "♗"
    board[6][7] = "♘"
    board[7][7] = "♖"
    until i == 8 do
      board[i][1] = "♟︎"
      board[i][6] = "♙"
      i += 1
    end
    board[0][0] = "♜"
    board[1][0] = "♞"
    board[2][0] = "♝"
    board[3][0] = "♛"
    board[4][0] = "♚"
    board[5][0] = "♝"
    board[6][0] = "♞"
    board[7][0] = "♜"
    board
  end

  def display_board(board)
    r = 7
    puts "―――――――――――――――――――――――――――――――――"
    until r < 0 do
      row = "|"
      c = 0
      until c == 8 do
        row += " " + board[c][r]
        row += " |"
        c += 1
      end
      puts row
      puts "―――――――――――――――――――――――――――――――――"
      r -= 1
    end
  end
end

class Game
  include Board
  attr_accessor :board

  def initialize
    @board = create_board
  end

  def play
    display_board(@board)
  end
end

game = Game.new
game.play