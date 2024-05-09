#!/usr/bin/env ruby
puts ARGV[0].scan(/(?<=(to:))\+(\d{11})|(\d{11})|(?<=(from:))\w{1,}|\+(\d{11})|(?<=(flags:)).{1,12}\d/)
