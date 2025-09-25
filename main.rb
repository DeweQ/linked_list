require_relative "lib/linked_list"

list = DataStructure::LinkedList.new
list.append "First"
list.append "Second"
list.append "Third"
list.append "Fourth"
list.prepend "Zero"
puts list
puts "at index 2 - #{list.at(2)}"
list.prepend "Negative one"
list.prepend "Negative two"
puts list
puts "at index 2 - #{list.at(2)}"
puts list.pop
puts list
puts list.pop
puts list
puts list.pop while list.size > 0
puts list
p list