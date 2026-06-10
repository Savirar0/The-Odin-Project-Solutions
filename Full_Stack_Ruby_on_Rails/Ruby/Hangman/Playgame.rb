require 'json'
require_relative 'Hangman'

game=Hangman.new

file_path=File.join(__dir__,"google-10000-english-no-swears.txt")
words=File.readlines(file_path,chomp:true)
p "Press 1 for new game"
p "Press 2 to load a game"
choice = gets.to_i

case choice

when 2
  p "Saved games:"
  path=File.join(__dir__,"saved")
  saved_games=Dir.children(path)
  if saved_games.length>0
    for i in 0..Integer(saved_games.length)-1
      p "Choose #{i} to load #{saved_games[i]}"
    end
    choice=gets.to_i
    file_path=File.join(__dir__,"saved",saved_games[choice])
    
    file_data = File.read(file_path)
    loaded_game_data = JSON.parse(file_data)
  
    puts "Game loaded successfully! Resuming..."
  
    game = Hangman.new
    game.play(
      loaded_game_data["word"],
      loaded_game_data["ans"],
      loaded_game_data["temp"],
      loaded_game_data["temp2"],
      loaded_game_data["chances"]
    )

  else
    p "No saved games available!"
  end

when 1
  words=words.filter{ |n| n.length>4 && n.length<13}
  word=words[rand(0..Integer(words.length))]
  chances=Integer(word.length)+4
  p "You have #{chances} chances"
  word=word.split("")
  ans=Array.new(word.length,"-")
  temp=word.clone
  temp2=word.clone
  game.play(word,ans,temp,temp2,chances)
end
