require_relative 'create'

class Logic
  attr_accessor :computer
  def initialize()
    v=Create.new
    @computer=v.comp
  end

  def check(plyr,count)
    green=0
    red=0
    tcomputer = computer.clone
    tplyr = plyr.clone

    if computer==plyr
      p "Player won, score: #{count}"
      return [4,0]
    end
    
    l=tplyr.length-1
    
    while l>=0 do
      if tplyr[l]==tcomputer[l]
        tplyr.delete_at(l)
        tcomputer.delete_at(l)
        green+=1
      end
      l-=1
    end

    while tplyr.length!=0
      guess_color = tplyr.pop
      found_index = tcomputer.index(guess_color)
      
      if found_index != nil
        red+=1
        tcomputer.delete_at(found_index)
      end
    end 

    [green,red]
  end

  def display()
    computer
  end
end