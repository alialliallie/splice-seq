# A really shoddy metronome that wraps up sleeping
class Metronome
  def initialize(bpm = 60)
    @beats_per_second = bpm / 60.0
  end

  # Divide the beat into 4 subsections, aka quarter notes
  def beat
    sleep((1.0 / @beats_per_second) / 4.0)
  end
end
