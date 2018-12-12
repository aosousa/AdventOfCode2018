require './utils'

def part1(input)
	two_letter_counter = 0
	three_letter_counter = 0

	input.each do | line |
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
	# loop through pairs of lines
	input.map(&:to_s).combination(2) do | line1, line2 |
		correct_letters = ""
		differences = 0
		(0..(line1.length - 1)).each {|i|
			if line1[i] != line2[i]
				differences += 1
			else
				correct_letters += line1[i]
			end
		}

		return correct_letters if differences == 1
	end
end

input = get_input("day2.txt").split

puts "Checksum: #{part1(input)}"
puts "Common letters between the two correct box IDs: #{part2(input)}"