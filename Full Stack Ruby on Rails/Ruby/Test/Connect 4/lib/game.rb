require 'matrix'
class Game
  attr_accessor:grid

  def initialize
    @grid=Array.new(6){Array.new(7,"-")}
  end

  def play()
    if horizontal? || vertical? || diagonal?
      "You win!"
    else
      "You lose!"
    end
    
  end

  def baseLogic(grid)
    grid.any? do |row|
      row.each_cons(4).any? do |four|
        four.uniq.length==1 && four.first!="-"
      end
    end
  end

  def horizontal?
    baseLogic(@grid)
  end

  def vertical?
    g=@grid.transpose
    baseLogic(g)
  end

  def diagonal?
    diags=get_diagonals()
    baseLogic(diags)
  end

  def get_diagonals
    left_to_right = Hash.new { |hash, key| hash[key] = [] }
    right_to_left = Hash.new { |hash, key| hash[key] = [] }
    (0..5).each do |row|
      (0..6).each do |col|
        piece = @grid[row][col]
        left_to_right[row - col] << piece
        right_to_left[row + col] << piece
      end
    end
    all_diagonals = left_to_right.values + right_to_left.values
    all_diagonals.select { |line| line.length >= 4 }
  end

end