# A really shoddy metronome that wraps up sleeping
class Metronome
  def initialize(bpm = 60)
    @beats_per_second = bpm / 60.0
  end

  def beat
    sleep(1.0 / @beats_per_second)
  end
end
