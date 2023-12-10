# Task
# Each game has a few sets within 
# Add all the colours for each game to get total 
# Check against possible amount 

def process_game_line(line)
  game, sets = line.split(': ')
  color_totals = Hash.new(0)
  
  sets.split('; ').each do |game_set|
    game_set.split(', ').each do |color_count|
      count, color = color_count.split
      color_totals[color] += count.to_i
    end
  end
  
  { game => color_totals }
end

def build_totals_hash(lines)
  totals = {}
  lines.each do |line|
    game_totals = process_game_line(line)
    totals.merge!(game_totals)
  end
  totals
end

lines = File.readlines("Day2/input.txt", chomp: true)

# p build_totals_hash(lines)
