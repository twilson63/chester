require 'helpers'
require 'commands/base'

Dir["#{File.dirname(__FILE__)}/commands/*"].each { |c| require c }

module Chester
  module Command
    class << self  
      def run(command, args)
        run_internal(command, args)
      end
      
      def run_internal(command, args)
        klass = eval("Chester::Command::#{command.capitalize}")
        runner = klass.new(args)
        runner.send(:index)
      end
      
    end
  end
end
