require 'toy_robot/position'

RSpec.describe "ToyRobot:Position" do

  subject { ToyRobot::Position.new(0,0) }

  describe 'initialise Position' do
    it 'should set value of x and y coordinate' do
      expect(subject.x_coordinate).to eq(0)
      expect(subject.x_coordinate).to eq(0)
    end
  end
end
