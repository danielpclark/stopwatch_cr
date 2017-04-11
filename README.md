[![Build Status](https://travis-ci.org/danielpclark/stopwatch_cr.svg)](https://travis-ci.org/danielpclark/stopwatch_cr)
[![SayThanks.io](https://img.shields.io/badge/SayThanks.io-%E2%98%BC-1EAEDB.svg)](https://saythanks.io/to/danielpclark)

# Stopwatch

_Ported from Ruby._

A stopwatch timer where you hit `mark` to start the timer and continue to hit `mark` to mark times.

## Installation

Add this line to your application's shard.yml:

```crystal
dependencies:
  stopwatch:
    github: danielpclark/stopwatch_cr
    branch: master
```

## Usage

```ruby
require 'stopwatch'

watch = Stopwatch::Timer.new

watch.mark
# => 2017-02-24 18:03:43 -0500

watch.time?
# => false

watch.mark
# => [44.973787791]

watch.time?
# => true

watch.mark
# => [44.973787791, 6.39862104]

watch.mark
# => [44.973787791, 6.39862104, 4.238468485]

watch.h # human total time
# => "00:00:55"

watch.ha # human average
# => "18.54 second average"

watch.times
# => [44.973787791, 6.39862104, 4.238468485]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/danielpclark/stopwatch_cr.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


