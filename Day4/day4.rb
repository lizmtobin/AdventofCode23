# rules 
# Find the winning scratch cards and sum
# each card has two lists of numbers separated by a vertical bar (|)
# winning numbers on the left and your numbers on the right
# Match numbers you have appear to the list of winning numbers.
# The first match makes the card worth one point 
# each match after the first doubles the point value of that card.
#add up the total point value of all the winning cards

# table = <<~INPUT
# Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
# Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
# Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
# Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
# Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
# Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
# INPUT

table = File.read('Day4/input.txt')
total_points = 0

table.each_line do |line|
  _, numbers = line.split(':')
  winning_numbers, player_numbers = numbers.split('|').map { |s| s.split.map(&:to_i) }
  matches = winning_numbers & player_numbers
  if matches.any?
    total_points += 2 ** (matches.size - 1)
  end
end

# Output the total points
puts "Total Points: #{total_points}"