#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')

require 'sequencer'

high_hat   = Track.new('--x---x---x---x-')
snare_drum = Track.new('----x-------x---')
bass_drum  = Track.new('x---x---x---x---')

seq = Sequencer.new(60,
                    'BD' => bass_drum,
                    'SD' => snare_drum,
                    'HH' => high_hat)

seq.run
