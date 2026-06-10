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
  def initialize(array)
    @root=build_tree(array)
  end

  def build(array,start,last)
    if start>last
      return nil
    end
    mid=start + (last - start)/ 2
    node=Node.new(array[mid],nil,nil)
    node.left=build(array,start,mid-1)
    node.right=build(array,mid+1,last)

    return node
    
  end

  def build_tree(array)
    array=array.sort.uniq
    build(array,0,array.length-1)
  end


  def pretty_print(node = @root, prefix = '', is_left: true)
    return unless node

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false)
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true)
  end

  def include(value)
    n=@root
    traverse(value,n)
  end

  def traverse(value,node)
    if node.data==value
      return true
    elsif node.right!=nil || node.left!=nil
      r=false
      l=false
      if node.right!=nil
        r=traverse(value,node.right)
      end
      if node.left!=nil
        l=traverse(value,node.left)
      end
      if r||l
        return true
      else
        return false
      end
    else
      return false
    end
  end


  def insert(value)
    node=@root
    inserting(value,node)
  end


  def inserting(value,node)
    if node!=nil
      if node.data==value
        return "inserted"
      end
    end

    if node.data<value
      if node.right==nil
        new=Node.new(value,nil,nil)
        node.right=new
        return "inserted"
      else
        inserting(value,node.right)
      end
    elsif node.data>value
      if node.left==nil
        new=Node.new(value,nil,nil)
        node.left=new
        return "inserted"
      else
        inserting(value,node.left)
      end
    
    end
    
  end


  def delete(value)
    deleting(@root,value)
  end

  def deleting(node,value)
    if node
      if node.left!=nil
        if node.left.data==value
          node.left=nil
          return "deleted"
        end
      end
      if node.right!=nil
          if node.right.data==value
            node.right=nil
            return "deleted"
          end
      end
      
      if node.data<value
        return deleting(node.right,value)
      else
        return deleting(node.left,value)
      end
      
    end
    return "not found"
  end



end


bst=Tree.new([2,3,4,1,6,77,9])
bst.pretty_print
puts bst.insert(7)
bst.pretty_print
puts bst.delete(77)
bst.pretty_print