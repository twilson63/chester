module Chester::Command
  class Install < Base
    def index
      display 'install chester.coffee in root'
      display 'create app.coffee'
      ChesterGenerators.run_cli(Dir.pwd, 'chester', '0.1', args)
    end
  end
end