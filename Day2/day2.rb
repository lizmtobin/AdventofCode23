# GAME 1 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

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

# GAME 2 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

def highest_color_value_per_game(lines)
  all_games = {}

  lines.each do |line|
    game, sets = line.split(': ')
    all_games[game] ||= {} 

    sets.split('; ').each do |set|
      set.split(', ').each do |color_count|
        count, color = color_count.split
        count = count.to_i
        all_games[game][color] = [all_games[game][color] || 0, count].max
      end
    end
  end

  all_games
end

def find_power_of_color(lines)
  total_power = 0
  high_colors = highest_color_value_per_game(lines)
  high_colors.each do |game, colors|
    total_power += colors['red'] * colors['green'] * colors['blue']
  end
  total_power
end

lines = File.readlines("Day2/input.txt", chomp: true)
# total_valid_games = find_total_valid_games(lines)
# puts "Total valid games: #{total_valid_games}"

# highest_color_value_per_game(lines)
p find_power_of_color(lines)