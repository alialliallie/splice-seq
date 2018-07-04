#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')

require 'sequencer'
require 'optparse'

options = { bpm: 120 }
optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: main.rb [options] track1 track2 ...'
  opts.on('--bpm=MANDATORY', 'Beats per minute (default 120)') do |bpm|
    options[:bpm] = bpm.to_i
  end
end

optparse.parse!

seq = Sequencer.new(options[:bpm])

ARGV.each do |track|
  name, spec = track.split('=')
  seq.add_track(name, Track.new(spec))
end

begin
  puts "3... 2... 1... let's jam!\n\n"
  seq.run
rescue Interrupt
  puts "\nAnd done!"
end
