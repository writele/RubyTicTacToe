# 1. Draw a board
# 2. Player picks a position to put X
# 3. Computer picks a position to put O
# 4. Repeats until Player or Computer wins or board is full
require 'pry'

def draw_board(b)
  system 'clear'
  puts "#{b[1]} | #{b[2]} | #{b[3]}"
  puts "___________"
  puts "#{b[4]} | #{b[5]} | #{b[6]}"
  puts "___________"
  puts "#{b[7]} | #{b[8]} | #{b[9]}"
end

def computer_choice(b)
  b.select {|k, v| v == " "}.keys.sample
end

def check_winner(b)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_lines.each do |line|
      if b[line[0]] == "X" && b[line[1]] == "X" && b[line[2]] == "X"
        return "Player"
      elsif b[line[0]] == "O" && b[line[1]] == "O" && b[line[2]] == "O"
        return "Computer"
      else
        return nil
      end
    end
end

def board_full(b)
  b.each do |k, v|
    if b[k] == " "
      return false
    end
  end  
end

b = {}
(1..9).each { |pos| b[pos] = " "}
b

begin
  puts "Choose a position (1-9):"
  player_choice = gets.chomp.to_i
  b[player_choice] = "X"
  draw_board(b)
  check_winner(b)
  binding.pry
  b[computer_choice(b)] = "O"
  draw_board(b)
  check_winner(b)
end until check_winner(b) || board_full(b)

if check_winner(b)
  puts "#{winner} won!"
elsif board_full(b)
  puts "It's a tie!"
end