require "set"
# rules 
# Part 1
# 1. Find all numbers that are adjacent to a symbol
# 2. Sum all of those numbers
# 3. Return the sum

# Part 2
# 1. Find gears. A gear is any * symbol that is adjacent to exactly two part numbers. 
# 2. The gear ratio is the result of multiplying those two numbers together.
# 3. find the gear ratio of every gear and add them all up

def is_symbol?(char)
  !char.match?(/[0-9a-zA-Z.]/)
end

def is_digit?(char)
  char >= '0' && char <= '9'
end

def number_adjacent_to_symbol?(grid, start_x, start_y)
  number = ""
  x = start_x
  y = start_y

  # Extract the whole number
  while y < grid[x].length && is_digit?(grid[x][y])
    number << grid[x][y]
    y += 1
  end

  (-1..1).each do |dx| 
    puts dx
    (-1..1).each do |dy|
      puts dy
      (start_y...y).each do |ny|
        nx = x + dx
        adj_x = nx
        adj_y = ny + dy
        next if dx == 0 && dy == 0
        if adj_x >= 0 && adj_y >= 0 && adj_x < grid.length && adj_y < grid[adj_x].length && is_symbol?(grid[adj_x][adj_y])
          return true
        end
      end
    end
  end
  false
end

def sum_part_numbers_from_file(filename)
  schematic = File.read(filename)
  grid = schematic.split("\n").map(&:chars) # Split into rows and then into characters. effectively a 2D array.
  sum = 0
  numbers_processed = {}

  grid.each_with_index do |row, x|
    row.each_with_index do |cell, y|
      next unless is_digit?(cell)
      next if numbers_processed[[x, y]] # locate via axis stored in hash

      if number_adjacent_to_symbol?(grid, x, y)
        number = ""
        while y < row.length && is_digit?(row[y])
          number << row[y]
          numbers_processed[[x, y]] = true
          y += 1
        end
        sum += number.to_i
      end
    end
  end

  sum
end

# part 2

input =  <<~INPUT
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
INPUT
puts input
# input = File.read("Day3/input.txt")
rows = input.each_line.map(&:chomp)
# rows = DATA.readlines.map(&:chomp)

syms = []

rows.each_with_index do |row, x|
  row.each_char.with_index do |char, y|
    # next if char == "."
    # next if char =~ /\d/
    # p [char, x, y]
    syms << [x, y] if char == "*"
  end
end

sum = 0
syms.each do |(x, y)|
  number_starts = Set.new

  [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1],
  ].each do |(dx, dy)|
    nx = x + dx
    ny = y + dy
    if rows[nx][ny] =~ /\d/
      nny = ny
      while rows[nx][nny - 1] =~ /\d/
        nny -= 1
      end
      number_starts << [nx, nny]
      puts number_starts
    end
  end

  if number_starts.length == 2
    
    require "pry"; binding.pry
    result = number_starts.map do |(x, y)|
      rows[x][y..].to_i
    end.inject(:*)
    sum += result
  end
end

p sum