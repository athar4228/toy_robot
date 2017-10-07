require 'toy_robot/table'


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

end
