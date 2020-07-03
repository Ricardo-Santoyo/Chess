class Board
  def create_board
    i = 0
    board = []
    8.times do
      column = []
      8.times do
        column << ""
      end
      board << column
    end
    board[0][0] = "♖"
    board[1][0] = "♘"
    board[2][0] = "♗"
    board[3][0] = "♕"
    board[4][0] = "♔"
    board[5][0] = "♗"
    board[6][0] = "♘"
    board[7][0] = "♖"
    until i == 8 do
      board[i][1] = "♙"
      board[i][6] = "♟︎"
      i += 1
    end
    board[0][7] = "♜"
    board[1][7] = "♞"
    board[2][7] = "♝"
    board[3][7] = "♛"
    board[4][7] = "♚"
    board[5][7] = "♝"
    board[6][7] = "♞"
    board[7][7] = "♜"
    board
  end
end