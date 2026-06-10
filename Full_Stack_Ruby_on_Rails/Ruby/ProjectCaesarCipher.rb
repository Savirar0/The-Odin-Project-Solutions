def caesar_cipher(str,shift)
  encrypt=""
  str.each_char do |i|
      if ('A'..'Z').include?(i)
        num=i.ord-65+shift
        rem=num%26
        letter=(rem+65).chr 
        encrypt<<letter
     
      elsif ('a'..'z').include?(i)
        num=i.ord-97+shift
        rem=num%26
        letter=(rem+97).chr 
        encrypt<<letter
      
      elsif ('0'..'9').include?(i)
        num=i.ord-48+shift
        rem=num%10
        letter=(rem+48).chr 
        encrypt<<letter
      
      else
        encrypt<<i

    
    
      end

  end
  encrypt

end

puts "Enter the string to be encrypted!"
str=gets.chomp
puts "Enter the shift value!"
shift=gets.chomp.to_i

puts caesar_cipher(str,shift)