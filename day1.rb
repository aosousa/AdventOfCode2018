require './utils'

def part1(input)
    input.readlines.map(&:to_i).sum
end

def part2(input)
    frequencies = Array.new
    frequency = 0
    found_duplicate = false

    # go back to the start of the file
    input.rewind

    # create an array of integers directly from the numbers inside the input file
    input_nums = input.readlines.map(&:to_i)

    until found_duplicate
        input_nums.each {|num|
            frequency += num
            if frequencies.include? frequency
                found_duplicate = true
                break
            else
                frequencies.push(frequency)
            end
        }
    end

    frequency
end

input = get_input("day1.txt")

puts "Frequency after changes: #{part1(input)}"
puts "First duplicate frequency: #{part2(input)}"