class NewGame

  attr_accessor :player1, :player2, :player1_counter, :player2_counter, :x_coordinate, :y_coordinate
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @number_of_rounds = 0
    @game_over = false
    @row1 = [nil, nil, nil]
    @row2 = [nil, nil, nil]
    @row3 = [nil, nil, nil]
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
      puts "#{player1} choose your X-coordinate..."
      x = gets.chomp.to_i
      x_coordinate = x
      puts "...and now your Y-coordiante"
      y = gets.chomp.to_i
      y_coordinate = y
      place_counter(x_coordinate,y_coordinate)
    else
      puts "#{player2} choose your X-coordinate..."
      x = gets.chomp.to_i
      x_coordinate = x
      puts "...and now your Y-coordiante"
      y = gets.chomp.to_i
      y_coordinate = y
      place_counter(x_coordinate,y_coordinate)
    end
  end

  def place_counter(x_coordinate, y_coordinate) 
    
    if number_of_rounds % 2 === 0
      counter = player2_counter
    else
      counter = player1_counter
    end

    if x_coordinate == 1 && y_coordinate == 1
      @row3[0] = counter
    elsif x_coordinate == 2 && y_coordinate == 1
      @row3[1] = counter
    elsif x_coordinate == 3 && y_coordinate == 1
      @row3[2] = counter
    elsif x_coordinate == 1 && y_coordinate == 2
      @row2[0] = counter
    elsif x_coordinate == 2 && y_coordinate == 2
      @row2[1] = counter
    elsif x_coordinate == 3 && y_coordinate == 2
      @row2[2] = counter
    elsif x_coordinate == 1 && y_coordinate == 3
      @row1[0] = counter
    elsif x_coordinate == 2 && y_coordinate == 3
      @row1[1] = counter
    else x_coordinate == 3 && y_coordinate == 3
      @row1[2] = counter
    end  
  end

  def check_for_winner
    if @row3[0] === @row3[1] && @row3[0] === @row3[2]
      if @row3[0] === nil || @row3[1] === nil || @row3[2] === 0
        return
      else
        @game_over = true
        puts "Game over"
      end 
    elsif @row2[0] === @row2[1] && @row2[0] === @row2[2]
      if @row2[0] === nil || @row2[1] === nil || @row2[2] === nil
        return
      else
        @game_over = true
        puts "Game over"
      end 
    elsif @row1[0] === @row1[1] && @row1[0] === @row1[2]
      if @row1[0] === nil || @row1[1] === nil || @row1[2] === nil
        return
      else
        @game_over = true
        puts "Game over"
      end 
    elsif @row1[0] === @row2[0] && @row1[0] === @row3[0]
      if @row1[0] === nil || @row2[0] === nil || @row3[0] === nil
        return
      else
        @game_over = true
        puts "Game over"
      end 
    elsif @row1[1] === @row2[1] && @row1[1] === @row3[1]
      if @row1[1] === nil || @row2[1] === nil || @row3[1] === nil
        return
      else
        @game_over = true
        puts "Game over"
      end 
    elsif @row1[2] === @row2[2] && @row1[2] === @row3[2]
      if @row1[2] === nil || @row2[2] === nil || @row3[2] === nil
        return
      else
        @game_over = true
        puts "Game over"
      end 
    elsif @row1[0] === @row2[1] && @row1[0] === @row3[2]
      if @row1[0] === nil || @row2[1] === nil || @row3[2] === nil
        return
      else
        @game_over = true
        puts "Game over"
      end 
    elsif @row1[2] === @row2[1] && @row1[2] === @row3[0]
      if @row1[2] === nil || @row1[1] === nil || @row3[0] === nil
        return
      else
        @game_over = true
        puts "Game over"
      end 
    end
  end

  def game_over
    @game_over
  end

  def print_board
    puts "\n"
    puts "\n"
    p @row1
    p @row2
    p @row3
  end

  def number_of_rounds
    @number_of_rounds += 1
  end

  require 'io/console'

  def continue_game
    print 'press any key to continue'
    STDIN.getch
    print "            \r"
  end
end
