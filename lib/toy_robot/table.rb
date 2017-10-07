module ToyRobot
  class Table

    attr_reader :left, :right, :bottom, :top

    def initialize
      @left = 0
      @bottom = 0
      @right = 4
      @top = 4
    end
  end
end
