module PlaceQueen
	def place_queen(col)
		# If we're out of places to place a queen, the board is complete.
		if col == @n
			#@solutions << Marshal.load(Marshal.dump(self))
			return true
		end
		
		@nstates += 1

		@n.times do |row|
			if is_valid?(row, col)
				@board[row * @n + col] = true

				if place_queen(col + 1)
					return true
				else
					@board[row * @n + col] = false
					next
				end
			end
		end
	
		false
	end
end