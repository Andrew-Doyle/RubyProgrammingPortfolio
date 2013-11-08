#family.rb

class Family	#methods in this class are called in the FamilyMember class declared in family_members.rb
  def parent?
    parent_or_child = @type #denotes fm instance variables
    role = @role
    age = @age
    name = @name

    if parent_or_child == 'Parent'
    then puts "Yes, this family member is a parent; more specifically, a #{role} named #{name} who is #{age} years old."  #message if true
    else puts "No, this family member is not a parent; it is a child..more specifically, a #{role} named #{name} who is #{age} years old."
    end
  end

  def child?
    parent_or_child = @type
    role = @role
    age = @age
    name = @name

    if parent_or_child == 'Child'
    then puts "Yes, this family member is a child; more specifically, a #{role} named #{name} who is #{age} years old."
    else puts "No, this family member is not a child; it is a parent, more specifically, a #{role} named #{name} who is #{age} years old."
    end
  end

end