require File.dirname(__FILE__) + '/../base'

module Chester::Command
  
  describe Install do
    before do
      @install = prepare_command(Install)
    end
    
    it "should create chester.coffee" do
      FileUtils.stub!(:cp).and_return(true)
      @install.should_receive(:display).with('installed chester.coffee in to the working directory....')
      
      @install.index
    end
    
  end
  
  
end
