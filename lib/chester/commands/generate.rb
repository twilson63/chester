require 'erubis'

module Chester::Command
  class Generate < Base
    def index
      if args.length < 2
        display 'Please enter [controller|model|view] [name]'
      elsif args.first =~ /^(controller|model|view)$/
        name = args[1].capitalize
        display 'create folder ' + args.first + 's if does not exist'
        FileUtils.mkdir_p args.first + 's'
        display 'create coffee class ' + name + 'Controller'
        input = File.read(File.dirname(__FILE__) + "/../templates/#{args.first}.coffee.erb")
        File.open "#{FileUtils.pwd}/#{args.first + 's'}/#{args[1]}_#{args.first}.coffee", 'w' do |f| 
          f.write Erubis::Eruby.new(input).result(:name => name, :action => args[2] || 'index')
        end
        display 'modify app.coffee'
      else
        display "#{args.first} not valid command"
      end
    end
  end
end