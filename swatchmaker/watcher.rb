#!/usr/bin/env ruby

require 'rubygems'
require 'directory_watcher'

dw = DirectoryWatcher.new 'swatch'
dw.interval = 1.0
dw.add_observer do |*args|
  args.each do |event|
    if /less/ =~ event.path
     `make OUTPUT_PATH=~/Sites/openblight/vendor/assets/stylesheets/ bootswatch`
      puts "#{Time.now.strftime("%I:%M:%S")} make bootswatch (since #{event.path} #{event.type})"
    end
  end
end

dw.start
gets      # when the user hits "enter" the script will terminate
dw.stop
