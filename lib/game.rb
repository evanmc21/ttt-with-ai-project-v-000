class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [

    [0,1,2],
    [3,4,5],
    [6,7,8],
    [1,4,7],
    [0,3,6],
    [0,4,8],
    [2,5,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
     won? || draw? ? true : false
  end

  def won?
    WIN_COMBINATIONS.each {|win_combo|
    index0 = board.cells[win_combo[0]]
    index1 = board.cells[win_combo[1]]
    index2 = board.cells[win_combo[2]]

    return win_combo if ((index0 == "X" && index1 == "X" && index2 == "X") || (index0 == "O" && index1 == "O" && index2 == "O"))
    }
    return false
end

def draw?
  !won? && board.full ? true : false
end

def winner
  if winner = won?
    board.cells[winner.first]

end
