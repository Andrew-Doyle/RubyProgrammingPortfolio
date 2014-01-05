#PRACTICAL 5 QUESTION TWO: CLASS INHERITANCE
# CLASS "A"
class ClubDepartments
  #create reader and writer in one go:
  attr_accessor :dept_name,:number_of_staff, :annual_cost, :location
  def initialize (dept_name, number_of_staff, annual_cost, location) #parameters for initialization during instantiation of class
    @dept_name = dept_name
    @number_of_staff = number_of_staff
    @location = location
    @annual_cost = annual_cost
  end

  def yearly_cost
    @annual_cost
    puts annual_cost
  end

  def monthly_cost
    @annual_cost
    weekly = annual_cost.to_i / 12
    puts weekly
  end

  def weekly_cost
    @annual_cost
    weekly = annual_cost.to_i / 52
    puts weekly
  end

end

# CLASS "B"
class FootballPlayers < ClubDepartments

  #create reader and writer in one go:
  attr_accessor :name,:role, :annual_cost, :age
  def initialize (name, role, annual_cost, age) #parameters for initialization during instantiation of class
    @name = name
    @role = role
    @age = age
    @annual_cost = annual_cost
  end

  def age_b
    @age
    puts age
  end

end

# CLASS "C"
class FootballCoaches < FootballPlayers
  attr_accessor :name,:role, :annual_cost, :age
  def initialize (name, role, annual_cost, age) #parameters for initialization during instantiation of class
    @name = name
    @role = role
    @age = age
    @annual_cost = annual_cost
  end

  def age_c
    @age
    puts age
  end

end

#HIGHEST CLASS INSTANCES - CLUB DEPARTMENTS
finance =  ClubDepartments.new('Finance','40','28000000','1A')
playing = ClubDepartments.new('Playing','110','52100200000','Carrington')
tech = ClubDepartments.new('IT','25','1125000','1B')
marketing = ClubDepartments.new('Marketing','50','2000000','2A')
hr = ClubDepartments.new('HR','15','525000','2B')

#FOOT PLAYER PLAYERS INSTANCES
wayne = FootballPlayers.new('Wayne Rooney', 'Striker', '240000' , '27' )
rvp = FootballPlayers.new('Robin Van Persie', 'Striker', '200000' , '30' )
rio = FootballPlayers.new('Rio Ferdinand', 'Defender', '90000' , '34' )
giggsy = FootballPlayers.new('Ryan Giggs', 'Midfielder', '50000' , '39' )
de_gea = FootballPlayers.new('David de Gea',  'Goalkeeper', '70000' , '22' )

#FOOTBALL COACHES INSTANCES
alex =  FootballCoaches.new('Sir Alex','Gaffer','18000000','71')
harry = FootballCoaches.new('HArry','Nr 2','200000','66')
avb = FootballCoaches.new('AVB','Pretender','1125000','39')

#TESTING METHOD ON INSTANCE OF CLASS WHERE METHOD WAS DEFINED
finance.yearly_cost

#TESTING INHERITANCE FROM CLASS "A" TO CLASS "C"
alex.yearly_cost
alex.monthly_cost
alex.weekly_cost

#TESTING INHERITANCE FROM CLASS "A" TO CLASS "B"
rio.yearly_cost
rio.monthly_cost
rio.weekly_cost

#TESTING INHERITANCE FROM CLASS "B" TO CLASS "C"
alex.age_b

#TESTING INHERITANCE FROM CLASS "C" TO CLASS "A"
#wayne.age_c  #This causes an error as method does not apply up the hierarchy


