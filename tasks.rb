tasks = []

loop do
  puts "\nTask List Manager"
  puts "1. Add a task"
  puts "2. View tasks"
  puts "3. Mark a task as completed"
  puts "4. Delete a task"
  puts "5. Quit"

  print "Select an option: "
  choice = gets.chomp.to_i

  case choice
  when 1
    # Add a task
    puts "Enter Task"
    item = gets
    tasks << item
	
  when 2
    # View tasks
    tasks.each do |task|
	puts "#{task}"
    end

  when 3
    # Mark a task as completed
    puts "Enter Task to Mark as complete"
    toChange = gets
    tasks.map! { |element|
	if (element == toChange)
	    element = element.chomp + " -- Complete"
        else
	    element
	end
    }
    puts "Marked as complete."

  when 4
    # Delete a task
    puts "Delete a task. Enter the task."
    taskToDelete = gets
    tasks.delete(taskToDelete)
    tasks = tasks.reject { |element| element.include?("-- Complete")}

  when 5
    puts "Goodbye!"
    break
  else
    puts "Invalid option. Please try again."
  end
end


=begin
    R    U    B    Y
  .....................
 /    :     |     :    \
'''''':''''':''''':''''''
 `.    .    :    .    .'
   `.   .   :   .   .'
     `.  .  :  .  .'
       `. . : . .'
         `..:..'
           `:'
=end
