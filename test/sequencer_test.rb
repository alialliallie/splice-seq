require 'test_helper'

describe Sequencer do
  let 'sequencer' do
    Sequencer.new(60,
                  'BD' => Track.new('x---x---'),
                  'SD' => Track.new('----x---'),
                  'HH' => Track.new('--x---x-'))
  end

  it 'makes beats' do
    enum = sequencer.each
    _, beat1 = enum.next
    _, beat2 = enum.next
    _, beat3 = enum.next
    _, beat4 = enum.next
    _, beat5 = enum.next

    beat1.must_equal ['x', ' ', ' ']
    beat2.must_equal [' ', ' ', ' ']
    beat3.must_equal [' ', ' ', 'x']
    beat4.must_equal [' ', ' ', ' ']
    beat5.must_equal ['x', 'x', ' ']
  end

  it 'prints beats nicely' do
    counter, interesting_beat = sequencer.take(5).last
    out = sequencer.format_beat(counter, interesting_beat)
    out.must_equal ' 1  x| x|  '
  end
end
