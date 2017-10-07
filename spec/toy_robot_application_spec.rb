require 'toy_robot/application'
RSpec.describe "ToyRobot:Application" do

  subject {ToyRobot::Application.new}

  describe 'initialise Application' do
  end

  describe 'application rules' do
    it 'should not return nil' do
      expect(subject.rules).not_to be nil
    end
  end
end
