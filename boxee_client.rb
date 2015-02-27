#!/usr/bin/env ruby -wKU
#                 _                 __       _     _____                      
#    __  ______  (_)___ ___  ____ _/ /______(_)  _/__  /  _  _____  _________ 
#   / / / / __ \/ / __ \__ \/ __ \/ __/ ___/ / |/_/ / /  | |/_/ _ \/ ___/ __ \
#  / /_/ / / / / / / / / / / /_/ / /_/ /  / />  <  / /___>  </  __/ /  / /_/ /
#  \__,_/_/ /_/_/_/ /_/ /_/\__,_/\__/_/  /_/_/|_| /____/_/|_|\___/_/   \____/ 
# 
#  http://apirate.iwasmeantto.be
#  2008-10-11 02:29               
                                                           
require "lib/boxee_growl_adapter"
GROWLNOTIFY_PATH = 'lib/growlnotify'

boxee = BoxeeAdapter.new

def growl_notify(msg, title='BoxeeGrowl')
  puts `#{GROWLNOTIFY_PATH} -n "BoxeeGrowl" -t "#{title}" --iconpath /Applications/Boxee.app -m "#{msg}"`
end

growl_notify 'Starting up...', 'BoxeeGrowl'
puts "BoxeeGrowl version #{BOXEE_GROWL_VERSION}"

while 1==1
 sleep 1
 if boxee.changed?
   # wait a bit since boxee updates the filename first and then updates the other info
   sleep 2
   # update again since boxee should by now have updated the information
   boxee.update
   
   # push the song change out via growl
   growl_notify("#{boxee.album} ", "#{boxee.artist}\n#{boxee.title}  (#{boxee.duration})")
   puts "Changing play info: #{boxee.title} by #{boxee.artist}"
   # the song just changed so lets lay off of the cpu for a bit
   sleep 3
 end
end