class Project
  attr_accessor :name, :description, :team
  def initialize(name, desc)
    @name = name
    @description = desc
    @team = []
    self
  end
  def elevator_pitch
    puts "My name is #{@name}, and #{@description}"
  end
  def add_to_team(name)
    @team.push(name)
    self
  end
end

Jack = Project.new('Jack', "I'm awesome")

# Jack.elevator_pitch
# Jack.add_to_team('Jack')
# puts Jack.team
