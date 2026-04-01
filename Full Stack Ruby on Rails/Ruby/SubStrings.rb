def subStr(str,dict)
  st=str.downcase
  word_count=Hash.new(0)
  for i in 0...dict.length
    if st.include?(dict[i])
      word_count[dict[i]]=st.scan(dict[i]).length
    end
  end
  word_count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts subStr("Howdy partner, sit down! How's it going?", dictionary)