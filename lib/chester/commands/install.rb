module Chester::Command
  class Install < Base
    def index
      FileUtils.cp File.dirname(__FILE__) + '/../templates/chester.coffee', FileUtils.pwd
      display 'installed chester.coffee in to the working directory....'
    end
  end
end