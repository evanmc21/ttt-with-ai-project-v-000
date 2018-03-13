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
     draw? || won? ? true : false
  end

  def won?
    WIN_COMBINATIONS.each {|win_combo|
    space_1 = board.cells[win_combo[0]]
    space_2 = board.cells[win_combo[1]]
    space_3 = board.cells[win_combo[2]]

    return win_combo if ((space_1 == "X" && space_2 == "X" && space_3 == "X") || (space_1 == "O" && space_2 == "O" && space_3 == "O"))
    }
    return false
end

def draw?
  !won? && board.full? ? true : false
end

def winner
  if winner = won?
    board.cells[winner.first]
  end
end

def turn
  puts "Player #{current_player.token}'s turn!"
  puts "Where would you like to move? (1-9)"

  board.display #returns curent state of the board after a turn

  user_input = current_player.move(board)

  if board.valid_move?(user_input)
    board.update(user_input, current_player)
  else
    puts "Sorry, Beyonce, but that character is invalid."
    turn
end

def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
  board.display
  end
end
end
