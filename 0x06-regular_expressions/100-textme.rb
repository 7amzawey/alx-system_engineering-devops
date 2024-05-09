#!/usr/bin/env ruby
log_line = ARGV[0]
from = log_line[/from:(\w+|\+\d{11})/, 1]
to = log_line[/to:(\w+|\+\d{11})/, 1]
flags = log_line[/flags:(.{1,12}\d)/, 1]
puts [from, to, flags].join(",")
