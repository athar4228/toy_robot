require 'toy_robot/application'
require 'toy_robot/table'


RSpec.describe "ToyRobot:Application" do

  subject {ToyRobot::Application.new}

  describe 'initialise Application' do
    it 'should return table instance' do
      expect(subject.table.instance_of? ToyRobot::Table).to eq(true)
    end
  end

  describe 'application rules' do
    it 'should not return nil' do
      expect(subject.rules).not_to be nil
    end
  end
end
