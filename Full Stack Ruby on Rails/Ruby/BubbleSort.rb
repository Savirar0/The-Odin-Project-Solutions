def bubble_sort(arr)
  for i in 0...arr.length
    swap = false
    
    for j in 0...(arr.length - i - 1)
      
      if arr[j] > arr[j+1]
        arr[j], arr[j+1] = arr[j+1], arr[j]
        swap = true 
      end
      
    end
    
    if !swap
      break
    end
  end
  
  arr
end

p bubble_sort([4,3,78,2,0,2])