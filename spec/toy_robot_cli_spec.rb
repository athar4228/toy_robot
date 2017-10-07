require 'toy_robot/cli'

RSpec.describe "ToyRobot:CLI" do

  describe 'display Initialization string' do
    def capture_name(name)
      $stdin = StringIO.new("#{name}\n")
      $stdin.gets.chomp
    end

    after do
      $stdin = STDIN
    end

    it "should be equal to user's input" do
      statement = "Test User"
      expect(capture_name(statement)).to be == statement
    end
  end
end
