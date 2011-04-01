module IsValid
	def is_valid?(row, col)
		# Check rows and columns.
		@n.times do |i|
			return false if @board[row * @n + i] or @board[i * @n + col]
		end

		# Diagonals.
		1.upto(col) do |i|
			break if row < i
			return false if @board[(row - i) * @n + col - i]
		end

		1.upto(col) do |i|
			break if (row + i) >= @n
			return false if @board[(row + i) * @n + col - i]
		end

		true
	end
end