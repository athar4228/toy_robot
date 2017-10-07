require 'toy_robot/table'
require 'toy_robot/position'

RSpec.describe "ToyRobot:Table" do

  subject {ToyRobot::Table.new}

  describe 'initialise Table' do
    it 'should set value for left coordinate' do
      expect(subject.left).to eq(0)
    end

    it 'should set value for bottom coordinate' do
      expect(subject.bottom).to eq(0)
    end

    it 'should set value for right coordinate' do
      expect(subject.right).to eq(4)
    end

    it 'should set value for top coordinate' do
      expect(subject.top).to eq(4)
    end
  end

  describe 'check coordinates' do
    it 'should return false if nil value is passed' do
      expect(subject.valid_coordinates?(nil)).to eq(false)
    end

    it 'should return false if position with invalid coordinates is passed' do
      position = ToyRobot::Position.new( 0, 8)
      expect(subject.valid_coordinates?(position)).to eq(false)
    end

    it 'should return true if position object with valid coordinates is passed' do
      position = ToyRobot::Position.new( 0, 0)
      expect(subject.valid_coordinates?(position)).to eq(true)
    end
  end
end
