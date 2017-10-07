require 'thor'
require_relative 'application'

module ToyRobot
  class CLI < Thor

    desc "Toy Robot", "place and move robot on the table based on user input"

    attr_accessor :application
    def init
      @application = Application.new
      print "---------------------------------------\n"
      print "       Application is started\n"
      print "---------------------------------------\n"

      render_application_rules

      get_instructions
    end

    default_task :init

    no_tasks do

      def get_instructions
        while command = $stdin.gets.chomp
          print "# #{command}\r\n"
        end
      end

      def render_application_rules
        print "Following commands are available:\n"
        print "#{application.rules}\n"
        print "#"
      end
    end
  end
end
