#family_members_q4.rb

class FamilyMemberQ4

  attr_accessor :name, :sex, :type, :role, :age
  def initialize (*args) #args refers to parameters passed during instantiation as shown below
    @name, @sex, @type, @role, @age = args
  end

end

# Below, an array is created called fm; instances of the class are then instantiated within the array elements
fm = []

# << pushes one instance at a time into the fm array
fm << FamilyMemberQ4.new('Andrew','Male', 'Child', 'Son' , '27' )
fm << FamilyMemberQ4.new('Bill','Male', 'Parent', 'Father' , '63' )
fm << FamilyMemberQ4.new('Samantha','Female', 'Parent', 'Mother' , '62' )
fm << FamilyMemberQ4.new('Thomas','Male', 'Child', 'Dog' , '10' )
fm << FamilyMemberQ4.new('Samantha', 'Female', 'Child', 'Dog' , '4' )

# Formats the desired output for each column
format = '%-15s %-8s %-7s %-7s %-7s %s'
puts "\n"
puts format % ['Family Member', 'Name', 'Sex', 'Type', 'Role', 'Age']

# i signifies label of index on first iteration, member refers to each instance
fm.each_with_index do |member, i|
  puts format % [ i+1, member.name, member.sex, member.type, member.role, member.age ]
end
