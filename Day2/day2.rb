def is_set_valid?(set)
  color_counts = Hash.new(0)
  set.split(', ').each do |color_count|
    count, color        = color_count.split
    color_counts[color] = count.to_i
  end
  color_counts['red'] <= 12 && color_counts['green'] <= 13 && color_counts['blue'] <= 14
end

def process_game_line(line)
  game, sets = line.split(': ')
  if sets.split('; ').all? { |set| is_set_valid?(set) }
    game.split.last.to_i
  else
    0
  end
end

def find_total_valid_games(lines)
  valid_games_count = 0
  lines.each do |line|
    valid_games_count += process_game_line(line)
  end
  valid_games_count
end

lines = File.readlines("Day2/input.txt", chomp: true)
total_valid_games = find_total_valid_games(lines)
puts "Total valid games: #{total_valid_games}"