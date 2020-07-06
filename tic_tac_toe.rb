require_relative 'NewGame.rb'

# Starts game. Player 1 enters their counter choice, "X" or "O". 
puts 'Player 1 type your name & press enter to continue.'
player1 = gets.chomp
puts 'Player 2 type your name & press enter to continue.'
player2 = gets.chomp

play_game = NewGame.new(player1, player2)

puts "#{play_game.player1}, choose 'X' or 'O'. Enter your choice now."

play_game.player1_counter = gets.chomp
play_game.counter_choice

puts "#{play_game.player1} is #{play_game.player1_counter}. #{play_game.player2} is #{play_game.player2_counter}"

play_game.continue_game
play_game.display

# Players select their rounds

x = 1
while x < 10
  play_game.number_of_rounds
  play_game.counter_coordinates
  play_game.display
  play_game.check_for_winner   # function not working
  x += 1
  break if play_game.game_over
end

unless play_game.game_over
  puts "DRAW!"
end