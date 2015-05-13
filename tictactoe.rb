# 1. Draw a board
# 2. Player picks a position to put X
# 3. Computer picks a position to put O
# 4. Repeats until Player or Computer wins or board is full
require 'pry'

def initialize_board
  b = {}
  (1..9).each { |pos| b[pos] = " "}
  b
end

def draw_board(b)
  system 'clear'
  puts "#{b[1]} | #{b[2]} | #{b[3]}"
  puts "___________"
  puts "#{b[4]} | #{b[5]} | #{b[6]}"
  puts "___________"
  puts "#{b[7]} | #{b[8]} | #{b[9]}"
end

def empty_spaces(b)
  b.select {|k, v| v == " "}.keys
end

def player_move(b)
  begin
    puts "Choose an empty square (1-9):"
    player_choice = gets.chomp
    if empty_spaces(b).include?(player_choice.to_i)
      b[player_choice.to_i] = "X"
      return false
    end
  end until false
end

def computer_move(b)
  computer_choice = empty_spaces(b).sample
  b[computer_choice] = "O"
end

def check_winner(b)
  win = nil
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_lines.each do |line|
      if b[line[0]] == "X" && b[line[1]] == "X" && b[line[2]] == "X"
        win = "Player"
        break
      elsif b[line[0]] == "O" && b[line[1]] == "O" && b[line[2]] == "O"
        win = "Computer"
        break
      else
        win = nil
      end
    end
    return win
end

board = initialize_board
draw_board(board)

begin
  player_move(board)
  computer_move(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_spaces(board).empty?

if winner
  puts "#{winner} won!"
else
  puts "It's a tie!"
end