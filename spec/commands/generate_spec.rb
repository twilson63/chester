require File.dirname(__FILE__) + '/../base'

module Chester::Command
  
  describe Generate do
    before do
      @generate = prepare_command(Generate)
    end
    
    it "should return not valid" do
      @generate.should_receive(:display).with("--app not valid command")
      @generate.index
    end
    
    it "should return controller|model|view arguments" do
      #@generate.should_receive(:display).with("Please enter [controller|model|view] [name]")
      @generate = Generate.new([])
      @generate.index
    end

    it "should return controller|model|view arguments" do
      #@generate.should_receive(:display).with("Please enter [controller|model|view] [name]")
      # @generate = Generate.new(['model','person'])
      # @generate.stub!(:create_foler).and_return(true)
      # 
      # @generate.index
    end
    
    
  end
  
  
end
