require_relative 'logicCheck'

game=Logic.new
exit=false
cnt=0

while exit==false
  p "Enter 1 to start"
  p "Enter 2 to end"
  val=gets.to_i
  case val
  when 1
    plyr=[]
    p "Enter your input, choose 4 colors"
    p "Current choice: #{plyr}"
    p "Enter the following colors(string,each at a time) 1-green 
       2-red 
       3-white 
       4-blue 
       5-yellow
       6-black"
    while plyr.length!=4
      color=gets.chomp
      plyr.push(color)
    end
    cnt+=1
    p game.display
    p "[greens,reds]"
    p game.check(plyr,cnt)

  
  when 2
    exit=true
  end
end