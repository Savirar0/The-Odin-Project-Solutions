require_relative 'create'

class Game
  def initialize
    @grid = Create.new
    @game_over = false
    
    puts "Enter name for Player 1 (Plays as X):"
    @p1_name = gets.chomp 
    
    puts "Enter name for Player 2 (Plays as O):"
    @p2_name = gets.chomp
    
    @current_player_name = @p1_name
    @current_marker = "X" 
  end

  def play
    while @game_over == false
      take_turn
      check_winner
      switch_player if @game_over == false 
    end
  end

  def take_turn
    turn_active = true
    
    while turn_active
      puts "\n--- #{@current_player_name}'s Turn (#{@current_marker}) ---"
      puts "1 - Display current tic tac toe"
      puts "2 - Place piece"
      puts "3 - Exit game"
      val = gets.to_i
      
      case val
      when 1
        @grid.display
      when 2
        place_piece
        turn_active = false 
      when 3
        @grid.display
        @game_over = true
        turn_active = false
      else
        puts "Failed, enter correct option."
      end
    end
  end

  def place_piece
    valid_placement = false
    
    while valid_placement == false
      puts "Enter X position (0, 1, or 2):"
      x = gets.to_i
      puts "Enter Y position (0, 1, or 2):"
      y = gets.to_i
      
      if x.between?(0, 2) && y.between?(0, 2) && @grid.grid[x][y] == nil
        @grid.grid[x][y] = @current_marker
        @grid.display
        valid_placement = true
      else
        puts "Invalid move! Space is taken or out of bounds. Try again."
      end
    end
  end

  def switch_player
    if @current_marker == "X"
      @current_marker = "O"
      @current_player_name = @p2_name
    else
      @current_marker = "X"
      @current_player_name = @p1_name
    end
  end

  def check_winner
    b = @grid.grid
    
    if (b[0][0] == b[0][1] && b[0][1] == b[0][2] && b[0][0] != nil) ||
       (b[1][0] == b[1][1] && b[1][1] == b[1][2] && b[1][0] != nil) ||
       (b[2][0] == b[2][1] && b[2][1] == b[2][2] && b[2][0] != nil) ||
       (b[0][0] == b[1][0] && b[1][0] == b[2][0] && b[0][0] != nil) ||
       (b[0][1] == b[1][1] && b[1][1] == b[2][1] && b[0][1] != nil) ||
       (b[0][2] == b[1][2] && b[1][2] == b[2][2] && b[0][2] != nil) ||
       (b[0][0] == b[1][1] && b[1][1] == b[2][2] && b[0][0] != nil) ||
       (b[0][2] == b[1][1] && b[1][1] == b[2][0] && b[0][2] != nil)
      
      puts "\n🎉 🎉 🎉 WOOO! #{@current_player_name} WINS! 🎉 🎉 🎉\n"
      @game_over = true
    end
  end
end


