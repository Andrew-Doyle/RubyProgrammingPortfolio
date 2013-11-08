#doggy.rb

#include other .rb files where methods are defined
require_relative 'cheers'
require_relative 'i_like_dogs'

#This method calls on two methods defined in other files
def get_details
  puts "What is your name?:"
  usersname = gets.chomp
	puts "What is your dogs name?:"
	dogsname = gets.chomp
	print_cheers(usersname)  #from cheers.rb
	print_like(dogsname)	 #from i_like_dogs.rb
	print_new_name(dogsname) #defined in this file
end

#This method is called in the get_details method
def print_new_name(doggy) #doggy is dynamically input by the user
	dogs_full_name = "\n" + doggy + " the doggy!!! (Yes..that was lame)"
	puts "Your doggies new name is: "
	puts dogs_full_name
end

get_details
