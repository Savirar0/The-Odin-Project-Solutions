def mergesort(arr)
  return arr if arr.length<=1

  mid=arr.length/2
  left=arr[0...mid]
  right=arr[mid..-1]

  sorted_left=mergesort(left)
  sorted_right=mergesort(right)

  merge(sorted_left,sorted_right)

end

def merge(left,right)
  res=[]
  until left.empty? || right.empty?
    if left.first <= right.first
      res<<left.shift
    else
      res<<right.shift
    end
  end
  res+left+right
end


p mergesort([1,2,6,5,44,2,10])

