#! /usr/bin/env ruby

# these should be switch-based inputs
lines      = File.readlines(ARGV[1])
lblock_pad = 4
FILLER     = ' '


half_idx = lines.size / 2
median   = lines.sort[half_idx].size
max_lblock = lines[0..half_idx].max.size
lblock_len = max_lblock + lblock_pad 

# heavy lifting
combo = (0..half_idx-1).map do |i|
  front = (lines[i+half_idx].size < median)  ? (FILLER*median) : lines[i+half_idx]
  front.gsub("\n",'').rjust(lblock_len, FILLER) +  e[i]
emd

# should emit to a file on a switch input
combo.each {|q| puts q }

