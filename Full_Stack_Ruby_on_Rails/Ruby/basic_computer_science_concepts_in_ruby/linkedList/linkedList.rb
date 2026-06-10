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
    if @tail
      temp=@head
      while temp.next!=@tail
        temp=temp.next
      end
      @tail=nil
      temp.next=nil
      @tail=temp
    else
      return nil
    end
  end

  def contains(value)
    if @head
      temp=@head
      while temp
        if temp.data==value
          return true
        end
        temp=temp.next
      end
      return false
    else
      return false
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

  def to_s
    if @head
      temp=@head
      while temp
        print "(#{temp.data}) -> "
        temp=temp.next
      end
    else
      return ""
    end
  end

  def insert_at(index, *values)
    return if values.empty?

    if index == 0
      values.reverse.each { |val| prepend(val) }
      return
    end

    current = @head
    count = 0

    while current && count < (index - 1)
      current = current.next
      count += 1 
    end
    return nil if current.nil?
    rest_of_list = current.next

    values.each do |num|
      new_node = Node.new(num)
      current.next = new_node 
      current = new_node      
    end

    current.next = rest_of_list
    if rest_of_list.nil?
      @tail = current
    end
  end


  def remove_at(index)
    if index<0
      return IndexError
    end
    if @head
      temp=@head
      cnt=0
      prev=@head
      while temp && cnt!=index
        prev=temp
        temp=temp.next
        cnt+=1
      end
      if cnt==index
        prev.next=temp.next
        temp=nil
      else
        return IndexError
      end

    else
      return IndexError
    end
  end

end




