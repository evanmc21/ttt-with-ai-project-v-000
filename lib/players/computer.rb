module Players
  class Computer < Player
  def move(board)
    if board.cells.count{|cell| cell != " "} == 0
      "1"
    elsif board.cells.count{|cell| cell != " "} == 1
      possible_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves = []
      possible_moves.each do |move| #iterate over the array of valid moves
        valid_moves << move if board.cells[move.to_i-1] == " "
      end
      valid_moves.example
    end
  end
end
end
