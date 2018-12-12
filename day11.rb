# get cell's power level through its coordinates
def cell_power_level(x, y)
	grid_serial_number = 6303

	rack_id = x + 10
	power_level = rack_id * y
	power_level += grid_serial_number
	power_level *= rack_id
	hund_digit = hundreds_digit(power_level)

	hund_digit - 5
end

# get a number's hundreds digit
def hundreds_digit(power_level)
	digits = power_level.abs.digits.reverse
	num_digits = digits.count
	hund_digit = 0

	hund_digit = digits[num_digits-3] unless num_digits == 0

	hund_digit
end

# build 300x300 grid with every cell's power level
def build_grid
	# create 300x300 grid
	grid = Array.new(301) {Array.new(301, 0)}

	# loop through rows
	(1..300).each do | r |
		# loop through columns
		(1..300).each do | c |
			# get power level for every cell
			grid[r][c] = cell_power_level(r, c)
		end
	end

	grid
end

# calculate a 3x3 square's total power
def calculate_square_total_power(grid, row_start, row_end, col_start, col_end)
	square_total_power = 0

	# loop rows
	(row_start..row_end).each do | r |
		# loop columns
		(col_start..col_end).each do | c |
			square_total_power += grid[r][c]
		end
	end

	square_total_power
end

def part1(grid)
	total_power = 0
	x, y = 0
	width = 3

	# iterate every 3rd row and column
	(1..298).each do | r |
		(1..298).each do | c |
			first_row, last_row, first_col, last_col = r, r - 1 + width, c, c - 1 + width
			square_power = calculate_square_total_power(grid, first_row, last_row, first_col, last_col)
			if square_power > total_power
				total_power = square_power
				x, y = first_row, first_col
			end
		end
	end

	"(" + x.to_s + "," + y.to_s + ")"
end

def part2(grid)
	total_power = 0
	x, y, s = 0

	# initially it was iterating every possible size from 1 to 300
	# but since the result turned out to be 12, it doesn't make sense to loop much further
	(1..20).each do | size |
		# get the last possible first row value for each size
		last_index = 300 - (size - 1)

		# loop rows
		(1..last_index).each do | r |
			# loop columns
			(1..last_index).each do | c |
				first_row, last_row, first_col, last_col = r, r - 1 + size, c, c - 1 + size
				square_power = calculate_square_total_power(grid, first_row, last_row, first_col, last_col)
				if square_power > total_power
					total_power = square_power
					x, y, s = first_row, first_col, size
				end
			end
		end
	end

	"(" + x.to_s + "," + y.to_s + "," + s.to_s + ")"
end

# build 301x301 grid with all power levels
grid = build_grid

puts "X, Y coordinate of the top-left fuel cell of the 3x3 square with the largest total power: #{part1(grid)}"
puts "X, Y, size identifier of the square with the largest total power: #{part2(grid)}"