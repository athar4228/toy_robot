require 'toy_robot/table'
require 'toy_robot/robot'


RSpec.describe "ToyRobot:Robot" do

  let(:table) {ToyRobot::Table.new}
  subject { ToyRobot::Robot.new(table) }

  describe 'initialise Robot' do
    it 'should set value of table' do
      expect(subject.table.instance_of? ToyRobot::Table).to eq(true)
    end
  end

  describe 'execute statement' do
    it 'should set command passed as parameter to execute method' do
      subject.execute("move")
      expect(subject.command).to eq('move')
    end
  end
end
