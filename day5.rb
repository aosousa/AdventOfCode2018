require './utils'

def react_polymer(polymer)
	counter = 0
	until counter == polymer.length - 1 do
		first_char, second_char = polymer[counter], polymer[counter+1]

		if first_char == second_char.swapcase
			polymer.slice!(counter + 1)
			polymer.slice!(counter)
			counter = counter - 1
		else
			counter += 1
		end
	end

	polymer
end

def part1(input)
	react_polymer(input).length
end

def part2(input)
	smallest_polymer_length = input.length

	('a'..'z').each do | letter |
		polymer = input.dup
		polymer.delete!(letter)
		polymer.delete!(letter.upcase)

		smallest_polymer_length = react_polymer(polymer).length if smallest_polymer_length > react_polymer(polymer).length
	end

	smallest_polymer_length
end

input = get_input("day5.txt")
puts "Units remaining: #{part1(input)}"
puts "Length of the shortest polymer: #{part2(input)}"