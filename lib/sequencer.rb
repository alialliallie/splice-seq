require 'track'
require 'metronome'

# Model a simple sequencer that "plays" tracks by printing on the screen
class Sequencer
  include Enumerable

  def initialize(bpm = 60, tracks = {})
    @bpm = bpm
    @tracks = tracks
  end

  # Add a track to the sequencer
  # If name is > 2 characters will be truncated. ABBREVIATE!
  def add_track(name, track)
    @tracks[name[0, 2]] = track.each
  end

  def header
    ' ' + @tracks.keys.join(' ')
  end

  def format_beat(counter, beat)
    c = (counter % 4) + 1
    # This is kind of hard-coded because we only support 4/4
    " #{c}  #{beat.join('| ')}"
  end

  def each(&block)
    # Convert to their enumerators, so no changing tracks mid-song!
    track_enumerators = @tracks.values.map(&:each)
    if block
      beat_enumerator(track_enumerators).each(&block)
    else
      beat_enumerator(track_enumerators)
    end
  end

  #   BD|SD|HH
  # 1  x|  |
  # 2   |  |
  # 3   |  | x
  # 4   |  |
  # 1  x| x|
  # 2   |  |
  # 3   |  | x
  # 4   |  |

  private

  def beat_enumerator(track_enumerators)
    Enumerator.new do |y|
      counter = 0
      loop do
        next_beat = track_enumerators.map { |t| t.next ? 'x' : ' ' }
        y << [counter, next_beat]
        counter += 1
      end
    end
  end
end
