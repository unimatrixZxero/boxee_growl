# boxee_growl
This is an old growl notifier I did for boxee a loooooong way back. Just put it up here for archival purposes.

## Original README
//                _                 __       _     _____
//   __  ______  (_)___ ___  ____ _/ /______(_)  _/__  /  _  _____  _________
//  / / / / __ \/ / __ \__ \/ __ \/ __/ ___/ / |/_/ / /  | |/_/ _ \/ ___/ __ \
// / /_/ / / / / / / / / / / /_/ / /_/ /  / />  <  / /___>  </  __/ /  / /_/ /
// \__,_/_/ /_/_/_/ /_/ /_/\__,_/\__/_/  /_/_/|_| /____/_/|_|\___/_/   \____/
//
// 2008-10-11 02:52
// BoxeeGrowl(working title) version 0.1
// http://apirate.iwasmeantto.be

So I finally came around to hacking something up. The initial version does what I want it to do just fine. I use a ruby script to poll the web service boxee can run. You have to enable it in the Network Settings.

Requirements:
• Mac OS X Leopard, or Mac OS X with working Ruby 1.8.6 installation
• Growl (of course http://growl.info/index.php)

Currently there are small limitations:
• you must set the port to 8888
• also leave away the password(boxee will display stars even if you leave it empty)
• I haven't packaged this in a cooca app yet so for now you will have to be comfortable with running it from Terminal.app
• if boxee's webserver is not running the app will refuse to start
• if you quit boxee the script also exits

Installation:
• Extract the folder anywhere you like
• Read the included BSD License and make sure you're fine with it
• open Terminal.app and navigate to the folder you just extracted (e.g. you extracted it on your desktop type 'cd Desktop/boxee_growl_v0.1'
• give the growlnotify binary execution rights by typing in 'chmod +x lib/growlnotify'

Usage:
• Start boxee and enable its web server
• navigate to the folder you extracted and type in 'ruby boxee_client.rb'

You should now see a Growl message that BoxeeGrowl is starting up and as soon as you play video or music you should see a notification pop up.
