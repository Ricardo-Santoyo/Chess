module Board
  def create_board #creates a nested array to represent the board
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
      puts row += " #{r + 1}"
      puts "―――――――――――――――――――――――――――――――――"
      r -= 1
    end
    puts "  a   b   c   d   e   f   g   h  "
  end
end

module Piece_movements
  def move_pawn(piece_position, new_position)
    x = piece_position[0]
    y = piece_position[1]
    new_x = new_position[0]
    new_y = new_position[1]
    pawn_color = board[x][y]
    diffrence_of_x = (x - new_x).abs
    diffrence_of_y = (y - new_y).abs

    if diffrence_of_x == 0 && diffrence_of_y == 1 #checks if it is a legal move
      board[x][y] = " "
      board[new_x][new_y] = "#{pawn_color}"
      board
    elsif diffrence_of_x == 0 && diffrence_of_y == 2 && (y == 1 || y == 6)
      board[x][y] = " "
      board[new_x][new_y] = "#{pawn_color}"
      board
    elsif diffrence_of_x == 1 && diffrence_of_y == 1 && board[new_x][new_y] != " "
      board[x][y] = " "
      board[new_x][new_y] = "#{pawn_color}"
      board
    else
      "illegal move"
    end
  end

  def move_rook(piece_position, new_position)
    x = piece_position[0]
    y = piece_position[1]
    new_x = new_position[0]
    new_y = new_position[1]
    pawn_color = board[x][y]
    diffrence_of_x = (x - new_x).abs
    diffrence_of_y = (y - new_y).abs
    if x < new_x #used to prevent jumping of pieces
      current_x = x + 1
      final_x = new_x
    else
      current_x = new_x + 1
      final_x = x
    end

    if y < new_y #used to prevent jumping of pieces
      current_y = y + 1
      final_y = new_y
    else
      current_y = new_y + 1
      final_y = y
    end

    if diffrence_of_x == 0 #checks if it is a legal move
      until current_y == final_y #used to prevent jumping of pieces
        if board[x][current_y] != " "
          return "illegal move"
        end
        current_y += 1
      end
      board[x][y] = " "
      board[new_x][new_y] = "#{pawn_color}"
      board
    elsif diffrence_of_y == 0
      until current_x == final_x #used to prevent jumping of pieces
        if board[current_x][y] != " "
          return "illegal move"
        end
        current_x += 1
      end
      board[x][y] = " "
      board[new_x][new_y] = "#{pawn_color}"
      board
    else
      "illegal move"
    end
  end
end

class Game
  include Board, Piece_movements
  attr_accessor :board

  def initialize
    @board = create_board
  end

  def letter_to_number_position(position)
    position = position.split("")
    case position[0].downcase
    when "a"
      position[0] = 0
    when "b"
      position[0] = 1
    when "c"
      position[0] = 2
    when "d"
      position[0] = 3
    when "e"
      position[0] = 4
    when "f"
      position[0] = 5
    when "g"
      position[0] = 6
    when "h"
      position[0] = 7
    else
      return "invaild position"
    end
    position[1] = position[1].to_i - 1
    position
  end

  def move(piece_position, new_position)
    piece_position = letter_to_number_position(piece_position)
    new_position = letter_to_number_position(new_position)
    piece = board[piece_position[0]][piece_position[1]]

    case piece #checks if there is a piece on that space
    when "♟︎", "♙"
      move_pawn(piece_position, new_position)
    when "♜", "♖"
      move_rook(piece_position, new_position)
    when "♞", "♘"
      move_knight(piece_position, new_position)
    when "♝", "♗"
      move_bishop(piece_position,new_position)
    when "♛", "♕"
      move_queen(piece_position,new_position)
    when "♚", "♔"
      move_king(piece_position,new_position)
    else
      "there is no piece on that space"
    end
  end

  def play
    display_board(@board)
  end
end

game = Game.new
game.play