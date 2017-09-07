require_relative 'projectClass'
#this line enacts the Rspec library and calls the describe method that takes in the class Project, when doing so it expects to do something
RSpec.describe Project do
  before do
    @p = Project.new('Project Name', 'I am a project')
  end

  it 'has a getter and setter for name' do
    expected = 'New desc'
    @p.name = expected

    expect(@p.name).to eq(expected)
  end

  it 'has a getter and setter for description' do
    expected = 'New desc'
    @p.description = expected
    expect(@p.description).to eq(expected)
  end

  it 'has a method elevator_pitch to explain name and description' do
    expect{@p.elevator_pitch}.to output("My name is #{@p.name}, and #{@p.description}\n").to_stdout
  end

  it "has a method that allows user to add new member to the team" do
    expect{@p.add_to_team('Jack')}.not_to raise_error
  end

  before do
    @p.add_to_team('Jack')
  end
  it "method add_to_team should add given member to team" do
    expect(@p.team).to eq(['Jack'])
  end

end
