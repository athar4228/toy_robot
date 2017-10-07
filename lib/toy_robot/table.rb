require_relative 'position'

module ToyRobot
  class Table

    attr_reader :left, :right, :bottom, :top

    def initialize
      @left = 0
      @bottom = 0
      @right = 4
      @top = 4
    end

    def valid_coordinates?(position)
      position.class == ToyRobot::Position &&
      check_x_coordinate?(position.x_coordinate) &&
      check_y_coordinate?(position.y_coordinate)
    end

    private

    def check_x_coordinate?(coordinate)
      (left..right).include?(coordinate)
    end

    def check_y_coordinate?(coordinate)
      (bottom..top).include?(coordinate)
    end
  end
end
