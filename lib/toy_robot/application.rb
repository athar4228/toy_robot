require_relative 'table'
require_relative 'robot'

module ToyRobot
  class Application

    attr_reader :table, :robot

    def initialize
      @table = Table.new
      @robot = Robot.new(@table)
    end

    def rules
      "1) PLACE X,Y,F eg: PLACE 0,0,NORTH\n"\
      "2) MOVE\n"\
      "3) LEFT\n"\
      "4) RIGHT\n"\
      "5) REPORT\n"\
      "6) To end game please enter EXIT or END\n"\
    end
  end
end
