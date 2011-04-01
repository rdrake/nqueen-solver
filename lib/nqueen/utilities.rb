module Utilities
	def to_s
		@n.times.collect { |i|
			@n.times.collect { |j|
				"#{@board[i * @n + j] ? 'Q' : '.'} "
			} * ""
		} * "\n"
	end
end