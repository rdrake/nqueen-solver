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
end

Trollop::die :n, "must be >= 4" if opts[:n] < 4