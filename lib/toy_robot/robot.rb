require_relative 'position'

module ToyRobot
  class Robot

    attr_reader :table
    attr_accessor :command, :position, :direction

    def initialize(table)
      @table = table
    end

    def execute(command)
      @command = command
      return unplaced_message if robot_unplaced?
      self.send(action.to_s)
    end

    private

    def place
      new_position = Position.new(new_x_coordinate, new_y_coordinate)
      if allowed?(new_position)
        @position = new_position
        @direction = new_direction
      else
         print "The position you have choosed for placing is not valid. Board is of Size 5-5\r \n"
      end
    end

    def move
      new_position = get_new_position
      if allowed?(new_position)
        @position = new_position
      else
        print "Your ROBOT cannot move forward facing #{direction} position. Board is of Size 5-5\r \n"
      end
    end

    def left
      @direction = get_next_left_direction
    end

    def right
      @direction = get_next_right_direction
    end

    def report
      print "- (#{position.x_coordinate}, #{position.y_coordinate}, #{direction})-- You are currently standing at X coordinate => #{position.x_coordinate} and Y coordinate => #{position.y_coordinate} FACING #{direction.upcase} -- \r \n"
    end

    def parameters
      command.split(/\W+/)[1..-1]
    end

    def new_x_coordinate
      parameters[0].strip.to_i
    end

    def new_y_coordinate
      parameters[1].strip.to_i
    end

    def new_direction
      parameters[2].strip
    end

    def allowed?(new_position)
      table.valid_coordinates?(new_position)
    end

    def get_new_position
      {
        "north" => Position.new(position.x_coordinate, position.y_coordinate + 1),
        "south" => Position.new(position.x_coordinate, position.y_coordinate - 1),
        "west"  => Position.new(position.x_coordinate - 1, position.y_coordinate),
        "east"  => Position.new(position.x_coordinate + 1, position.y_coordinate),
      }[direction]
    end

    def get_next_left_direction
      {
        "north" => "west",
        "south" => "east",
        "west"  => "south",
        "east"  => "north",
      }[direction]
    end

    def get_next_right_direction
      {
        "north" => "east",
        "south" => "west",
        "west"  => "north",
        "east"  => "south",
      }[direction]
    end

    def robot_unplaced?
      unplaced? && action != "place"
    end

    def placed?
      position != nil
    end

    def unplaced?
      !placed?
    end

    def unplaced_message
      print "Your ROBOT is not yet placed, Please Place it first using PLACE X, Y, F command\n"
    end

    def action
      command.split(/\W+/).first()
    end
  end
end
