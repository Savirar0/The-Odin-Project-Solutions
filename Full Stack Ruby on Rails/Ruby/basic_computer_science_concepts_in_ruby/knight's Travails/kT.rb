 class KnightNode
   attr_accessor :position, :path
  def initialize(position,path)
    @position=position
    @path=path
  end
 end
  
 


class ChessBoard
  def valid_moves(position)
    x, y = position
    moves = [
      [x+1, y+2], [x+2, y+1], [x+2, y-1], [x+1, y-2],
      [x-1, y-2], [x-2, y-1], [x-2, y+1], [x-1, y+2]
    ]
    moves.select { |pos| pos[0].between?(0, 7) && pos[1].between?(0, 7) }
  end

  def knight_moves(start, target)
    start_node = KnightNode.new(start, [start])
    
    queue = [start_node]
    visited = [start]

    while !queue.empty?
      current_node = queue.shift 

      if current_node.position == target
        puts "Moves to reach target: #{current_node.path.length - 1},and path to reach target:"
        current_node.path.each { |pos| p pos }
        return current_node.path
      end

      next_moves = valid_moves(current_node.position)

      next_moves.each do |move|
        unless visited.include?(move)
          visited << move
          new=KnightNode.new(move,current_node.path+[move])
          queue<<new

        end
      end
    end
  end
end





board = ChessBoard.new
board.knight_moves([3,3], [4,3])