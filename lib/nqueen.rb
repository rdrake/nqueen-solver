#!/usr/bin/env ruby
require "rubygems"
require "trollop"

opts = Trollop::options do
	version "N-Queen Solver v0.1 (c) 2011 Richard Drake"
	banner <<-EOS
Solves the n-queen problem optionally using CSP.

Usage:
    ruby #{$PROGRAM_NAME} [options]

where [options] are:
EOS

	opt :n, "Size of board (n x n)", :default => 4
	opt :csp, "Use constrait satisfaction", :default => false
	opt :once, "Only find the first solution", :default => false
	opt :print, "Print out statistics", :default => true
	opt :verbose, "Print out all found solutions", :default => false
end

Trollop::die :n, "must be >= 4" if opts[:n] < 4

$LOAD_PATH << "./nqueen"

require "nqueen"

n = NQueen.new(opts[:n], once=(opts[:once]))
n.solve

if opts[:print]
	puts n
end

if opts[:verbose]
	n.solutions.each do |sol|
		n.print_board(sol)
		puts
	end
end