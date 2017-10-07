module ToyRobot
  class Position

    attr_accessor :x_coordinate, :y_coordinate

    def initialize(x, y)
      @x_coordinate = x
      @y_coordinate = y
    end
  end
end
