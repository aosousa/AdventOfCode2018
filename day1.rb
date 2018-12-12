require './utils'

def part1(input)
    input.sum
end

def part2(input)
    frequencies = Array.new
    frequency = 0
    found_duplicate = false

    until found_duplicate
        input.each {|num|
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

input = get_input("day1.txt").split.map(&:to_i)
puts "Frequency after changes: #{part1(input)}"
puts "First duplicate frequency: #{part2(input)}"