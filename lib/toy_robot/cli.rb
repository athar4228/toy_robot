require 'thor'

module ToyRobot
  class CLI < Thor

    desc "Toy Robot", "place and move robot on the table based on user input"

    def init
      get_instructions
    end

    default_task :init

    no_tasks do

      def get_instructions
        while command = $stdin.gets.chomp
          print "# #{command}\r\n"
        end
      end
    end
  end
end
