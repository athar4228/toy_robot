require_relative 'table'
require_relative 'robot'

module ToyRobot
  class Application

    ALLOWABLE_COMMANDS = %w(place move left right report)
    REGEX_TO_MATCH_PLACE_COMMAND = /PLACE(\s)*([0-4])(\s)*,(\s)*([0-4])(\s)*,(\s)*(NORTH\b|SOUTH\b|EAST\b|WEST\b)/i

    attr_reader :table, :robot
    attr_accessor :command

    def initialize
      @table = Table.new
      @robot = Robot.new(@table)
    end

    def execute_command(command)
      @command = command
      if valid_command?
        @robot.execute(@command)
      else
        invalid_command
      end
    end

    def rules
      "1) PLACE X,Y,F eg: PLACE 0,0,NORTH\n"\
      "2) MOVE\n"\
      "3) LEFT\n"\
      "4) RIGHT\n"\
      "5) REPORT\n"\
      "6) To end game please enter EXIT or END\n"\
    end

    def invalid_command
      print "Command you enter is invalid or out of range, Please enter valid ones\n"
    end

    private

    def valid_command?
      ALLOWABLE_COMMANDS.include?(action) && valid_format?
    end

    def valid_format?
      return true unless action == "place"
      return true if (command =~ REGEX_TO_MATCH_PLACE_COMMAND) == 0
      return false
    end

    def action
      initial = command.split(/\W+/).first()
      return initial if initial == "place"
      return command.strip
    end
  end
end
