require 'toy_robot/application'
require 'toy_robot/table'

RSpec.describe "ToyRobot:Application" do

  subject {ToyRobot::Application.new}

  describe 'initialise Application' do
    it 'should return table instance' do
      expect(subject.table.instance_of? ToyRobot::Table).to eq(true)
    end

    it 'should return robot instance' do
      expect(subject.robot.instance_of? ToyRobot::Robot).to eq(true)
    end
  end

  describe 'application rules' do
    it 'should not return nil' do
      expect(subject.rules).not_to be nil
    end
  end

  describe 'validate commands' do
    it 'should return false for non-allowable commands' do
      subject.command = 'TEST'
      expect(subject.send :valid_command?).to eq(false)
    end

    it 'should return true for move command' do
      subject.command = 'move'
      expect(subject.send :valid_command?).to eq(true)
    end

    it 'should return true for right command' do
      subject.command = 'right'
      expect(subject.send :valid_command?).to eq(true)
    end

    it 'should return true for left command' do
      subject.command = 'left'
      expect(subject.send :valid_command?).to eq(true)
    end

    it 'should return true for report command' do
      subject.command = 'report'
      expect(subject.send :valid_command?).to eq(true)
    end

    it 'should return true for place command' do
      subject.command = 'place 0,0, north'
      expect(subject.send :valid_command?).to eq(true)
    end

    it 'should return false for invalid place command with out of bound coordinates' do
      subject.command = 'place 0,7, north'
      expect(subject.send :valid_command?).to eq(false)
    end

    it 'should return false for invalid place command with invalid pole' do
      subject.command = 'place 0,2, poll'
      expect(subject.send :valid_command?).to eq(false)
    end
  end
end
