require 'toy_robot/table'
require 'toy_robot/robot'

RSpec.describe "ToyRobot:Robot" do

  let(:table) { ToyRobot::Table.new }
  subject { ToyRobot::Robot.new(table) }

  describe 'initialise Robot' do
    it 'should set value of table' do
      expect(subject.table.instance_of? ToyRobot::Table).to eq(true)
    end
  end

  describe 'execute statement' do
    it 'should set command passed as parameter to execute method' do
      subject.execute("place 0,0, north")
      expect(subject.command).to eq('place 0,0, north')
    end
  end

  describe 'PLACE statement' do
    it 'should not place if coordinates are invalid' do
      subject.execute("place 0,8, north")
      expect(subject.position).to eq(nil)
    end

    it 'should place if coordinates are valid' do
      subject.execute("place 0, 0, north")
      expect(subject.position).not_to eq(nil)
      expect(subject.position.x_coordinate).to eq(0)
      expect(subject.position.y_coordinate).to eq(0)
    end

    it 'should place again if robot is placed' do
      subject.execute("place 0, 0, north")
      subject.execute("place 1, 1, east")
      expect(subject.position).not_to eq(nil)
      expect(subject.position.x_coordinate).to eq(1)
      expect(subject.position.y_coordinate).to eq(1)
    end
  end

  describe 'MOVE statement' do
    it 'should not move if table is ended' do
      subject.execute("place 0,4, north")
      subject.execute('move')
      expect(subject.position.x_coordinate).to eq(0)
      expect(subject.position.y_coordinate).to eq(4)
    end

    it 'should move if table is available' do
      subject.execute("place 0, 0, north")
      subject.execute('move')
      expect(subject.position.x_coordinate).to eq(0)
      expect(subject.position.y_coordinate).to eq(1)
    end

    it 'should not move if robot is not placed' do
      subject.execute('move')
      expect(subject.position).to eq(nil)
    end
  end

  describe 'LEFT statement' do
    it 'should change direction to west if currently facing north' do
      subject.execute("place 0,0, north")
      subject.execute('left')
      expect(subject.direction).to eq('west')
    end

    it 'should change direction to east if currently facing south' do
      subject.execute("place 0,0, south")
      subject.execute('left')
      expect(subject.direction).to eq('east')
    end

    it 'should change direction to south if currently facing west' do
      subject.execute("place 0,0, west")
      subject.execute('left')
      expect(subject.direction).to eq('south')
    end

    it 'should change direction to north if currently facing east' do
      subject.execute("place 0,0, east")
      subject.execute('left')
      expect(subject.direction).to eq('north')
    end

    it 'should not change direction if robot is not placed' do
      subject.execute('left')
      expect(subject.position).to eq(nil)
    end
  end

  describe 'RIGHT statement' do
    it 'should change direction to east if currently facing north' do
      subject.execute("place 0,0, north")
      subject.execute('right')
      expect(subject.direction).to eq('east')
    end

    it 'should change direction to west if currently facing south' do
      subject.execute("place 0,0, south")
      subject.execute('right')
      expect(subject.direction).to eq('west')
    end

    it 'should change direction to north if currently facing west' do
      subject.execute("place 0,0, west")
      subject.execute('right')
      expect(subject.direction).to eq('north')
    end

    it 'should change direction to south if currently facing east' do
      subject.execute("place 0,0, east")
      subject.execute('right')
      expect(subject.direction).to eq('south')
    end

    it 'should not change direction if robot is not placed' do
      subject.execute('right')
      expect(subject.position).to eq(nil)
    end
  end

  describe 'REPORT statement' do
    it 'should not report if robot is not placed' do
      subject.execute('report')
      expect(subject.position).to eq(nil)
    end

    it 'should report position if robot is placed' do
      subject.execute("place 0,0, north")
      subject.execute('report')
      expect(subject.position).not_to eq(nil)
    end

  end
end
