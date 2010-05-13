require 'erubis'

module Chester::Command
  class Generate < Base
    def index
      if args.length < 2
        display 'Please enter [controller|model|view|helper] [name]'
      elsif args.first =~ /^(controller|model|view|helper)$/
        create_folder args.first + 's'
        name = args[1].capitalize
        action = args[2] || 'index'

        input = File.read(File.dirname(__FILE__) + "/../templates/#{args.first}.coffee.erb")
        File.open get_filename(args.first, name, action), 'w' do |f| 
          f.write Erubis::Eruby.new(input).result(:name => name, :action => action)
        end
        
        display 'modify app.coffee'
      else
        display "#{args.first} not valid command"
      end
    end
    
    def create_folder(folder_name)
      display 'create folder ' + args.first + 's if does not exist'
      FileUtils.mkdir_p args.first + 's'      
    end
    
    def get_filename(file_type, filename, action = 'index')
      result = "#{FileUtils.pwd}/#{file_type + 's'}/#{filename.downcase}"
      if file_type == 'controller'
        result += "_#{args.first}.coffee"
      elsif file_type == 'view'
        FileUtils.mkdir_p result
        result += "/#{action}.coffee"
      elsif file_type == 'helper'
        result += "_#{args.first}.coffee"        
      else
        result += ".coffee"
      end
    end
    
    
  end
end