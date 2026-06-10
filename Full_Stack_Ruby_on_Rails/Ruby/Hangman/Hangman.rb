class Hangman
  def play(word,ans,temp,temp2,chances)
    found=false
    while found!=true && chances>0
      p ans.join
      p "Chances left: #{chances}"
      p "Enter a letter of your choice."
      letter=gets.chomp
      
      if temp.include?letter
        temp.each_with_index do |char, index|
          if char == letter
            temp[index] = "-"   
            ans[index] = letter
          end
        end
      else
        chances-=1
      end 

      puts ans.join(" ")

      if ans==word
        p "You won! points: #{chances}"
        p temp2.join("")
        found=true
        chances=0
        break
      end

      if chances>0
        puts "Do you want to save game here?"
        puts "Enter 1 to save or anything else skip"
        c=gets.chomp
        if c=="1"
          saved_game_data = {
            "word" => word,
            "ans" => ans,
            "temp" => temp,
            "temp2" => temp2,
            "chances" => chances
          }
          save_folder=File.join(__dir__,"saved")
          save_loop=true
          n=0
          while save_loop==true
            check_path=File.join(save_folder,"saved_game#{n}.json")
            if File.exist?(check_path)
              n+=1
            else
              File.open(check_path, "w") do |file|
                file.write(JSON.dump(saved_game_data))
              end
              save_loop=false
            end

          end
          found=false
          chances=0
          break
        end
      end
      if chances==0
        p temp2
      end
    end
    
  end
end