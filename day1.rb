require './utils'

def part1(input)
    return input.readlines().map(&:to_i).sum()
end

def part2(input)
    frequencies = Array.new
    frequency = 0
    foundDuplicate = false
    
    # go back to the start of the file
    input.rewind()

    # create an array of integers directly from the numbers inside the input file
    inputNums = input.readlines().map(&:to_i)

    until foundDuplicate
        for num in inputNums do
            frequency += num
            if frequencies.include? frequency
                foundDuplicate = true
                break
            else
                frequencies.push(frequency)                
            end
        end
    end

    return frequency
end

def solution
    input = get_input("day1.txt")

    return part1(input), part2(input)
end

puts solution