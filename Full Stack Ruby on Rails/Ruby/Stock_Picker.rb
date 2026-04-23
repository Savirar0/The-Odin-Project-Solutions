def stockPicker(arr)
  profit=0
  minn = arr[0]
  indx=[]
  
  for i in arr
    if i - minn > profit
      
      profit = [profit, i-minn].max
      indx = [arr.index(minn), arr.index(i)]
      
    end
    minn=[minn,i].min 
  end
  
  indx
end

puts stockPicker([17,3,6,9,15,8,6,1,10]).inspect