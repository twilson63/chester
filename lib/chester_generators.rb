require 'templater'

module ChesterGenerators 
  extend Templater::Manifold
  
  class InstallGenerator < Templater::Generator
    def self.source_root
      File.join(File.dirname(__FILE__), 'templates')
    end
    
    
    file :chester, 'chester.coffee'
  end
  
  add :install, InstallGenerator
end


