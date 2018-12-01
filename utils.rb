def get_input(filename)
    # read input from file
    inputFile = File.open(filename, "r")

    return inputFile
end