require_relative 'table'

module ToyRobot
  class Application

    attr_reader :table

    def initialize
      @table = Table.new
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
