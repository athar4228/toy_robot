module ToyRobot
  class Robot

    attr_reader :table
    attr_accessor :command

    def initialize(table)
      @table = table
    end

    def execute(command)
      @command = command
      self.send(action.to_s)
    end

    private

    def move
    end

    def left
    end

    def right
    end

    def report
    end

    def place
    end

    def action
      command.split(/\W+/).first().downcase
    end
  end
end
