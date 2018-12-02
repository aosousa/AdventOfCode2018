require './utils'

def part1(input)
	two_letter_counter = 0
	three_letter_counter = 0

	input.readlines.each do |line|
		found_two_letter_occurrence = false
		found_three_letter_occurrence = false

		line.each_char do |char|
			if line.count(char) == 3
				three_letter_counter += 1 unless found_three_letter_occurrence
				found_three_letter_occurrence = true
			elsif line.count(char) == 2
				two_letter_counter += 1 unless found_two_letter_occurrence
				found_two_letter_occurrence = true
			end
		end
	end

	two_letter_counter * three_letter_counter
end

def part2(input)
	# go back to the start of the file
	input.rewind

	# create array of strings from the lines in the input file
	input_array = input.readlines.map(&:to_s)

	# loop through pairs of lines
	input_array.combination(2) do |line1, line2|
		correct_letters = ""
		differences = 0
		for i in 0..(line1.length - 1) do
			if line1[i] != line2[i]
				differences += 1
			else
				correct_letters += line1[i]
			end
		end

		return correct_letters if differences == 1
	end
end

input = get_input("day2.txt")

puts "Checksum: #{part1(input)}"
puts "Common letters between the two correct box IDs: #{part2(input)}"