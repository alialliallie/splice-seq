# SM-808

Text-based sequencer-simulator.

## Usage

```
./main.rb --bpm=[bpm] TN=x---x---x---x--- ...
```

Track specifiers are `name=[spec]`, the spec treats `-` as no beat and
`x` as beat. Only the first two letters of the name will be output. Add
as many tracks at you like!

## Four on the Floor

The sample four-on-the-floor rhythm at 120bpm is in
`four_on_the_floor.sh`. Run that to get the basic example output.
