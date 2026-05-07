class Node
  attr_accessor :data, :left, :right
  def initialize(data,left,right)
    @data=data
    @left=left
    @right=right
  end
end

class Tree
  attr_accessor :root
  def initialize()
    
  end

  def build(array,start,last)
    if start>last
      return nil
    end
    @root=Node.new(array[array.length/2])
    @root.left=build(array,start,mid)
    @root.right=build(array,mid,start)

    return @root
    
  end

  def build_tree(array)
    array.sort
    array=array.uniq
    build(array,array[0],array[-1])
  end

  
end