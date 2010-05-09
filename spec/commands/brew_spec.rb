require File.dirname(__FILE__) + '/../base'

module Chester::Command
  
  describe Brew do
    before do
      @brew = prepare_command(Brew)
    end
    
    it "should compile all of the coffee scripts" do
      @brew.should_receive(:display).exactly(3).times
      Dir.stub!(:glob).and_return(['test.coffee'])
      @brew.should_receive(:system)
      @brew.index
    end
    
  end
  
  
end
