#family_members.rb

require_relative 'family'

class FamilyMember < Family #allows the use of methods in the Family class from family.rb
  #create reader and writer in one go:	
  attr_accessor :name, :sex, :type, :role, :age
  def initialize (name, sex, type, role, age) #parameters for initialization during instantiation of class
    @name = name
    @sex = sex
    @type = type
    @role = role
    @age = age
  end

end

# Below, a hash is created called fm; instances of the class are then instantiated within the hash elements
fm = {}
fm[1] = FamilyMember.new('Andrew','Male', 'Child', 'Son' , '27' )
fm[2] = FamilyMember.new('Bill','Male', 'Parent', 'Father' , '63' )
fm[3] = FamilyMember.new('Samantha','Female', 'Parent', 'Mother' , '62' )
fm[4] = FamilyMember.new('Thomas','Male', 'Child', 'Dog' , '10' )
fm[5] = FamilyMember.new('Samantha', 'Female', 'Child', 'Dog' , '4' )

# Below, the check_details method asks the user which family member they wish to check, and the parent? or child? methods are called
define_method :check_details  do #allows variables to be accessed outside of this scope (as opposed to def)

  repeat = '' 	#variable to check whether or not to repeat loop

  while repeat != 0
    puts "\nWhat family member do you want to check? choose 1 to 5"
    family = gets.chomp		#chomp removes carriage return characters
    num = family.to_i		#convert to integer

    puts "Checking family member #{num}"

    puts "\nDo you want to check if family member #{num} are a child or an parent?"
    puts "Child  | 0"
    puts "Parent | 1"

    userchoice = gets.chomp
    choice = userchoice.to_i

    case
    when choice == 0
      if fm.key?(num) then	#check if given key is present in the hash
        fm[num].child?		#call the child? method on the given instance
      end
    when choice == 1
      if fm.key?(num) then
        fm[num].parent?
      end
    else
      puts 'Be Careful - You must choose 0 or 1. 0 for child or 1 for parent'
    end

    puts "\nDo you want to check another family member?"
    puts "Exit          | 0"
    puts "Check Another | 1"
    repeat = gets.chomp
    repeat = repeat.to_i	#users choice on whether to repeat program - this is the condition for the loop

  end

end

check_details				#method called