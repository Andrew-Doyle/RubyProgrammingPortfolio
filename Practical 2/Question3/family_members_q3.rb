#family_members_q3.rb

class FamilyMemberQ3
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

# Below, an array is created called fm; instances of the class are then instantiated within the array elements
fm = []

# << pushes one instance at a time into the fm array
fm << FamilyMemberQ3.new('Andrew','Male', 'Child', 'Son' , '27' )
fm << FamilyMemberQ3.new('Bill','Male', 'Parent', 'Father' , '63' )
fm << FamilyMemberQ3.new('Samantha','Female', 'Parent', 'Mother' , '62' )
fm << FamilyMemberQ3.new('Thomas','Male', 'Child', 'Dog' , '10' )
fm << FamilyMemberQ3.new('Samantha', 'Female', 'Child', 'Dog' , '4' )

# 1 signifies label of index on first iteration, member refers to each instance
fm.each.with_index(1) { |member, index|
  puts "Family member #{index}:  #{member.name},a #{member.sex} #{member.type}; specifically: a #{member.role} aged #{member.age}"
}

