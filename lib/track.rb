# Represents a (looping) track definition using a - and x syntax.
# a - means do not play the sample, x means play the sample
#
# Example:
#   bass_drum = Track.new('x---x---x---x---')
class Track
  include Enumerable

  def initialize(pattern = '-')
    @seq = parse(pattern)
  end

  def each(&block)
    beats = @seq.cycle
    if block
      beats.each(&block)
    else
      beats.each
    end
  end

  private

  # Parse a pattern. - is silence, anything else is a beat
  # Probably shouldn't accept spaces in patterns
  def parse(pattern)
    pattern
      .each_char
      .map { |c| c != '-' }
  end
end
