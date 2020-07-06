class NewGame

  attr_accessor :player1, :player2, :player1_counter, :player2_counter, :place_counter
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @number_of_rounds = 0
    @game_over = false
    # @row1 = [1, 2, 3]
    # @row2 = [4, 5, 6]
    # @row3 = [7, 8, 9]
    @board = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"]
    ]
  end

  def display
    @board.each do |row|
      row.each do |cell|
        print cell + " "
      end
      print "\n"
    end
  end

  def counter_choice
    if player1_counter === 'X' || player1_counter === 'x'
      @player2_counter = 'O'
    else
      @player2_counter = 'X'
    end
  end

  def counter_coordinates
    if number_of_rounds % 2 === 0
      puts "#{player1}, select a number to place your counter..."
      x = gets.chomp.to_i
      place_counter = x
      place_counter(place_counter)
    else
      puts "#{player2}, select a number to place your counter..."
      x = gets.chomp.to_i
      place_counter = x
      place_counter(place_counter)
    end
  end

  def place_counter(place_counter) 
    if number_of_rounds % 2 === 0
      counter = player2_counter
    else
      counter = player1_counter
    end

    if place_counter === 1
      @board[0][0] = counter
    elsif place_counter === 2
      @board[0][1] = counter
    elsif place_counter === 3
      @board[0][2] = counter
    elsif place_counter === 4
      @board[1][0] = counter
    elsif place_counter === 5
      @board[1][1] = counter
    elsif place_counter === 6
      @board[1][2] = counter
    elsif place_counter === 7
      @board[2][0] = counter
    elsif place_counter === 8
      @board[2][1] = counter
    else place_counter === 9
      @board[2][2] = counter
    end
  end

  def check_for_winner
    if @board[2][0] === @board[2][1] && @board[2][0] === @board[2][2]
      if @board[2][0] === nil || @board[2][1] === nil || @board[2][2] === 0
        return
      else
        @game_over = true
        print_winner
      end
    elsif @board[1][0] === @board[1][1] && @board[1][0] === @board[1][2]
      if @board[1][0] === nil || @board[1][1] === nil || @board[1][2] === nil
        return
      else
        @game_over = true
        print_winner
      end
    elsif @board[0][0] === @board[0][1] && @board[0][0] === @board[0][2]
      if @board[0][0] === nil || @board[0][1] === nil || @board[0][2] === nil
        return
      else
        @game_over = true
        print_winner
      end
    elsif @board[0][0] === @board[1][0] && @board[0][0] === @board[2][0]
      if @board[0][0] === nil || @board[1][0] === nil || @board[2][0] === nil
        return
      else
        @game_over = true
        print_winner
      end
    elsif @board[0][1] === @board[1][1] && @board[0][1] === @board[2][1]
      if @board[0][1] === nil || @board[1][1] === nil || @board[2][1] === nil
        return
      else
        @game_over = true
        print_winner
      end
    elsif @board[0][2] === @board[1][2] && @board[0][2] === @board[2][2]
      if @board[0][2] === nil || @board[1][2] === nil || @board[2][2] === nil
        return
      else
        @game_over = true
        print_winner
      end 
    elsif @board[0][0] === @board[1][1] && @board[0][0] === @board[2][2]
      if @board[0][0] === nil || @board[1][1] === nil || @board[2][2] === nil
        return
      else
        @game_over = true
        print_winner
      end 
    elsif @board[0][2] === @board[1][1] && @board[0][2] === @board[2][0]
      if @board[0][2] === nil || @board[0][1] === nil || @board[2][0] === nil
        return
      else
        @game_over = true
        print_winner 
      end 
    end
  end

  def game_over
    @game_over
  end

  # def print_board
  #   display
  #   # puts "\n"
  #   # puts "\n"
  #   # p @row1
  #   # p @row2
  #   # p @row3
  # end

  def number_of_rounds
    @number_of_rounds += 1
  end

  def print_winner 
    if number_of_rounds % 2 === 0
      puts "Game over, #{player1} wins!"
    else
      puts "Game over, #{player2} wins!"
    end
  end

  require 'io/console'

  def continue_game
    print 'press any key to continue'
    STDIN.getch
    print "            \r"
  end
end
