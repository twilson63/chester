module Chester::Command
  class Brew < Base
    def index
      display "Start Brewing"
      Dir.glob("#{FileUtils.pwd}/**/*.coffee").each do |f|
        system "coffee -c #{f}"
        display "Brewed #{f}..."
      end
      display "Finished Brewing...."
    end
  end
end