require_relative 'NewGame.rb'

# Starts game. Player 1 enters their counter choice, "X" or "O". 

play_game = NewGame.new("Christian", "Amy")

puts "#{play_game.player1}, choose 'X' or 'O'. Enter your choice now."

play_game.player1_counter = gets.chomp
play_game.counter_choice

puts "#{play_game.player1} is #{play_game.player1_counter}. #{play_game.player2} is #{play_game.player2_counter}"

play_game.continue_game
play_game.print_board

# Players select their rounds

x = 10
until x < 10
  play_game.number_of_rounds
  play_game.counter_coordinates
  play_game.print_board
  play_game.check_for_winner
  break if play_game.game_over
end