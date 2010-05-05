module Chester::Command
  class Generate < Base
    def index
      if args.length < 2
        display 'Please enter [controller|model|view] [name]'
      elsif args.first =~ /^(controller|model|view)$/
        display 'create folder ' + args.first + 's if does not exist'
        display 'create coffee class ' + args[1].capitalize + 'Controller'
        display 'modify app.coffee'
      else
        display "#{args.first} not valid command"
      end
    end
  end
end