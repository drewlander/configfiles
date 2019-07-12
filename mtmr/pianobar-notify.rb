#!/usr/bin/ruby
 
trigger = ARGV.shift
filename = '/full/path/.config/pianobar/current_song'
if trigger == 'songstart'
  songinfo = {}
 
  STDIN.each_line { |line| songinfo.store(*line.chomp.split('=', 2))}
  `terminal-notifier -title "Now Playing" -message "#{songinfo['title']}\nby #{songinfo['artist']}"`
  text="#{songinfo['title']} by #{songinfo['artist']}"
  File.open(filename, 'w+') { |file| file.write(text) }
elsif trigger == 'act_quit'
  File.open(filename, 'w+') { |file| file.write('') }
else
  File.open(filename+'_yay', 'w+') {|file| file.write(trigger)}	
end
