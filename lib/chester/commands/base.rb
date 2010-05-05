module Chester::Command
  class Base
    include Chester::Helpers

    attr_accessor :args
    def initialize(args)
      @args = args
    end
    
    def display(msg, newline=true)
      if newline
        puts(msg)
      else
        print(msg)
        STDOUT.flush
      end
    end
    
  end
end
