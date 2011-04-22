=begin
1... Visited 1 states and found 1 solution(s).
2... Visited 2 states and found 0 solution(s).
3... Visited 5 states and found 0 solution(s).
4... Visited 16 states and found 2 solution(s).
5... Visited 53 states and found 10 solution(s).
6... Visited 152 states and found 4 solution(s).
7... Visited 551 states and found 40 solution(s).
8... Visited 2056 states and found 92 solution(s).
9... Visited 8393 states and found 352 solution(s).
10... Visited 35538 states and found 724 solution(s).
=end

class NQueen
	attr_reader :solutions, :nstates

	def initialize(n, once=false)
		@n = n
		@solutions = []
		@nstates = 0
		@flag = false
		@once = once
	end

	def solve
		place_queen(0, Array.new(@n * @n).collect do false end)
	end

	def print_board(board)
		@n.times do |m|
			@n.times do |n|
				print " #{board[resolve_pos(m, n)] ? 'Q' : '.'}"
			end

			puts
		end
	end

	def to_s
		"Visited #{@nstates} states and found #{@solutions.count} solution(s)."
	end

	private
	
	def place_queen(row, board)
		return if @once and @flag
		
		@nstates += 1
		
		0.upto(@n - 1) do |col|
			if not is_conflict?(row, col, board)
				board[resolve_pos(row, col)] = true
				
				# Got a solution, do stuff.
				if row == (@n - 1)
					@solutions << Marshal.load(Marshal.dump(board))
					@flag = true
					board[resolve_pos(row, col)] = false
					break
				else
					place_queen(row + 1, board)
				end
				
				board[resolve_pos(row, col)] = false
			end
		end
	end

	def is_conflict?(row, col, board)
		# Check up for conflicts.
		0.upto(row) do |r|
			return true if board[resolve_pos(r, col)] and r != row
		end

		# Check the diagonals.
		(row - 1).downto(0).each_with_index do |r, i|
			pos_offset = i + 1 + col
			neg_offset = col - i - 1
			
			return true if pos_offset < @n and board[resolve_pos(r, pos_offset)]
			return true if neg_offset >= 0 and board[resolve_pos(r, neg_offset)]
		end

		false
	end

	def resolve_pos(row, col)
		row * @n + col
	end
end
