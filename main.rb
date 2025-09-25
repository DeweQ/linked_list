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
puts "Pop: " + list.pop.to_s
puts list
puts "Second? " + list.contains?("Second").to_s
puts "0? " + list.contains?(0).to_s
puts "Negative two? " + list.contains?("Negative two").to_s
puts "Pop: " + list.pop.to_s
puts list
i = list.find("Zero")
puts "At [#{i}] - #{list.at(i)}"
puts list
i = list.find("Negative two")
puts "At [#{i}] - #{list.at(i)}"
puts list
i = list.find("Second")
puts "At [#{i}] - #{list.at(i)}"
list.insert_at("One and a half", i)
puts "Insert 1.5", list.size, list
list.insert_at("Negative three",0)
puts "Insert -3", list.size, list
list.insert_at("Negative two and a half",1)
puts "Insert -2.5", list.size, list

puts list
puts "Removed at 1"
list.remove_at(1)
puts list.size, list
puts "Removed at 0"
list.remove_at(0)
puts list.size, list
puts "Removed last"
list.remove_at(list.size - 1)
puts list.size, list

list.remove_at(0) until list.size < 1
puts list
list.remove_at(0)
puts list
p list

list.insert_at(1234,1234)
