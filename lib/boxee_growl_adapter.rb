#!/usr/bin/env ruby -wKU
#                 _                 __       _     _____                      
#    __  ______  (_)___ ___  ____ _/ /______(_)  _/__  /  _  _____  _________ 
#   / / / / __ \/ / __ \__ \/ __ \/ __/ ___/ / |/_/ / /  | |/_/ _ \/ ___/ __ \
#  / /_/ / / / / / / / / / / /_/ / /_/ /  / />  <  / /___>  </  __/ /  / /_/ /
#  \__,_/_/ /_/_/_/ /_/ /_/\__,_/\__/_/  /_/_/|_| /____/_/|_|\___/_/   \____/ 
#                                                                            
#  http://apirate.iwasmeantto.be
#  2008-10-11 02:29                          
                                                
require 'net/http'
require 'uri'

BOXEE_GROWL_VERSION = '0.1.1'

class BoxeeAdapter
  # in future I might just pull this data from
  # /Users/#{USER_NAME}/Library/Application\ Support/BOXEE/UserData/guisettings.xml 
  BOXEE_HOST = 'localhost'
  BOXEE_PORT = 8888
  
  # boxee web service API
  BOXEE_API_COMMAND_CALL = 'xbmcCmds/xbmcHttp?command='
  BOXEE_API_CURRENT = 'getcurrentlyplaying'
  
  def initialize
    @boxee_info = @cache = nil
  end
  
  def changed?
    update
    if filename == @cache
      return false
    elsif filename != ''
      @cache = filename
      return true
    end
    # (data_valid?)? @boxee_info.include?('<li>Changed:True') : false
  end
  
  def send_command(command)
    begin
      Net::HTTP.get URI.parse("http://#{BOXEE_HOST}:#{BOXEE_PORT}/#{BOXEE_API_COMMAND_CALL}#{command}")
    rescue Exception => e
      puts 'Error: Cannot connect to Boxee!'
      puts 'Please start the Boxee web service. You will find it in the Network Settings.'
      puts 'For further help please check the README.txt or the boxee support forums'
      exit
    end
  end
  
  def update
    fetch = send_command BOXEE_API_CURRENT
    return false unless playing?(fetch)
    @boxee_info = fetch 
  end  
  
  def data_valid?
    @boxee_info.class.eql? String
  end
  
  def grep_info(what)
    (data_valid?)? @boxee_info.scan(/\<li\>#{what}\:(.+)/).first : ''     
  end
  
  def playing?(info_string)
    info_string.include?('<li>PlayStatus:Playing')
  end
  
  def title
    grep_info 'Title'
  end
  
  def track
    grep_info 'Track'
  end
  
  def artist
    grep_info 'Artist'
  end
  
  def album
   grep_info 'Album'
  end
  
  def duration
    grep_info 'Duration'
  end
  
  def filename
    grep_info 'Filename'
  end
end