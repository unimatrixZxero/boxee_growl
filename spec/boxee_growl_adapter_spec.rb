#!/opt/local/bin/ruby
#                 _                 __       _     _____                      
#    __  ______  (_)___ ___  ____ _/ /______(_)  _/__  /  _  _____  _________ 
#   / / / / __ \/ / __ \__ \/ __ \/ __/ ___/ / |/_/ / /  | |/_/ _ \/ ___/ __ \
#  / /_/ / / / / / / / / / / /_/ / /_/ /  / />  <  / /___>  </  __/ /  / /_/ /
#  \__,_/_/ /_/_/_/ /_/ /_/\__,_/\__/_/  /_/_/|_| /____/_/|_|\___/_/   \____/ 
#                                                                            
#  http://apirate.iwasmeantto.be
#  2008-10-11 02:29                          
require 'lib/boxee_growl_adapter.rb'

describe BoxeeAdapter do
  setup do
    @box = BoxeeAdapter.new
  end
  
  it "should be able to fetch something from the server" do
    @box.update.should =~ /\<li\>.*/    
  end
  
  it "should should give me a title" do
    @box.update
    @box.title.should_not eql(false)    
    @box.title.should_not match(/(^$)/)
  end
  
  it "should detect if the title changed and since it is nil when we start expect it to have changed" do
    @box.changed?.should == true
  end
end