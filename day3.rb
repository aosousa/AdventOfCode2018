require './utils'

def part1(input)
	# create 1000 x 1000 multidimensional array
	fabric = Array.new(1000) { Array.new(1000, 0)}

	# create array of MatchData objects from the lines in the input file
	input_array = input.split("\n").map do |line|
		line.match(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/)
	end

	input_array.map(&:to_a).each do | match_data |
		column, row, width, height = match_data[2, 5].map(&:to_i)

		# loop through rows
		(row..row + height - 1).each do | r |
			# loop through columns
			(column..column + width - 1).each do | c |
				fabric[r][c] += 1
			end
		end
	end


	return input_array, fabric
end

def part2(input_array , fabric)
	# create array to keep track of the overlapped and non overlapped claims
	overlaps_array = Array.new(fabric.length, true)

	# use input and fabric array from the previous part of the challenge
	input_array.map(&:to_a).each do | match_data |
		overlaps = false
		id, column, row, width, height = match_data[1, 5].map(&:to_i)

		# loop through rows
		(row..row + height - 1).each do | r |
			# loop through columns
			(column..column + width - 1).each do | c |
				overlaps = true if fabric[r][c] > 1
			end
		end

		overlaps_array[id] = false unless overlaps
	end

	overlaps_array
end

input = get_input("day3.txt")

# use .flatten to turn array into one dimensional array instead of the matrix above and so that .count works properly
input_array, fabric = part1(input)

puts "Square inches of fabric within two or more claims: #{fabric.flatten.count{| f | f > 1}}"
puts "ID of the claim that doesn't overlap: #{part2(input_array, fabric).find_index(false)}"