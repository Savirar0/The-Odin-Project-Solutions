require_relative 'linkedList'

LL = LinkedList.new

loop do
  puts ""
  puts "--- Linked List Menu ---"
  puts "1. Add to end (Append)"
  puts "2. Add to start (Prepend)"
  puts "3. Remove from end (Pop)"
  puts "4. Print the list"
  puts "5. Get the size"
  puts "6. Exit"
  print "Enter your choice (1-6): "

  choice = gets.chomp.to_i

  if choice == 1
    print "What value do you want to append? "
    val = gets.chomp
    LL.append(val)
    puts "Added!"
    
  elsif choice == 2
    print "What value do you want to prepend? "
    val = gets.chomp
    LL.prepend(val)
    puts "Added!"
    
  elsif choice == 3
    LL.pop
    puts "Popped the last item!"
    
  elsif choice == 4
    print "Current list: "
    LL.to_s
    puts ""
    
  elsif choice == 5
    puts "The list has #{LL.size} items."
    
  elsif choice == 6
    puts "Bye!"
    break 
    
  else
    puts "Not a valid option. Try again."
  end
end