class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next= nil
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    node = Node.new(data)
    
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def prepend(data)
    node = Node.new(data)
    
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next= @head
      @head = node
    end
  end

  def size
    count = 0
    temp = @head
    while temp 
      count += 1
      temp = temp.next
    end
    count
  end

  def head
    if @head
      return @head.data
    else
      return nil
    end
  end

  def tail
    if @tail
      return @tail.data
    else
      return nil
    end
  end

  def at(index)
    if @head
      cnt=0
      temp=@head
      while temp && cnt!=index
        temp=temp.next
        cnt+=1
      end
      if cnt!=index
        return nil
      else
        return temp.data
      end
    else
      return nil 
    end
  end

  def pop
    if @head
      temp=@head.next
      @head.data=nil
      @head=nil
      @head=temp
    else
      return nil
    end
  end

  

  def index(value)
    if @head
      temp=@head
      cnt=0
      while temp && temp.data != value
        temp=temp.next
        cnt+=1
      end
      if temp.data==value
        return cnt
      else
        nil
      end
    else
      return nil
    end
  end

  def 

end