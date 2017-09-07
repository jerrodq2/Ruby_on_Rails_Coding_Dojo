class Project
  attr_accessor :name, :description
  def initialize(name, desc)
    @name = name
    @description = desc
    self
  end
  def elevator_pitch
    puts "My name is #{@name}, and #{@description}"
  end
end

Jack = Project.new('Jack', "I'm awesome")

Jack.elevator_pitch
