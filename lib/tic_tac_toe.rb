WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count do |position|
    position == "X" || position == "O"
  end
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def play(board)
  if over?(board)
    display_board(board)
  end
  turn(board)
end

def full?(board)
  board.all?{|token| token == "X" || token =="O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  !won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if combo = won?(board)
    board[combo.first]
  end
end

def play(board)
while !over?(board)
  turn(board)
end

if won?(board)
  puts "Congratulations #{winner(board)}!"
end

if draw? (board)
  puts "Cat's Game!"
end
