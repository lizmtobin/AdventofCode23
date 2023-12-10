require_relative '../Day2/day2.rb'

describe 'valid_game_count' do
 
  describe 'is_set_valid?' do
    it 'returns true when the set is valid' do
      expect(is_set_valid?('2 red, 3 green, 4 blue')).to eq(true)
    end

    it 'returns false when the set is invalid' do
      expect(is_set_valid?('5 red, 6 green, 50 blue')).to eq(false)
    end
  end

  describe 'process_game_line' do
    it 'returns the game score when all sets are valid' do
      expect(process_game_line('Game 1: 2 green, 6 blue, 7 red; 12 green, 6 blue, 3 red')).to eq(1)
    end

    it 'returns 0 when at least one set is invalid' do
      expect(process_game_line('Game 7: 19 green, 2 red, 5 blue; 4 blue, 8 green; 2 red, 2 green, 9 blue')).to eq(0)
    end
  end

  describe 'find_total_valid_games' do
    it 'returns the total count by adding game ids' do
      lines = [
        'Game 1: 2 red, 3 green, 4 blue; 1 red, 2 green, 3 blue',
        'Game 3: 5 red, 6 green, 7 blue; 2 red, 3 green, 4 blue',
        'Game 5: 1 red, 1 green, 1 blue; 2 red, 2 green, 2 blue'
      ]
      expect(find_total_valid_games(lines)).to eq(9)
    end
  end
end
