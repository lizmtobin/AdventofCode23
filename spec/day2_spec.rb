require_relative '../Day2/day2.rb'

RSpec.describe 'build_totals_hash' do
  let(:test_lines) do
    [
      "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
      "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
      "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
      "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
      "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
    ]
  end

  describe '#process_game_line' do
    it 'correctly processes a single line of game data' do
      line = test_lines.first
      puts line
      expected_output = { "Game 1" => {"blue" => 9, "red" => 5, "green" => 4} }
      expect(process_game_line(line)).to eq(expected_output)
    end
  end

  describe '#build_totals_hash' do
    it 'correctly processes multiple lines of game data' do
      expected_output = {
      "Game 1" => {"blue" => 9, "red" => 5, "green" => 4},
      "Game 2" => {"blue" => 6, "green" => 6, "red" => 1},
      "Game 3" => {"green" => 26, "blue" => 11, "red" => 25},
      "Game 4" => {"green" => 7, "red" => 23, "blue" => 21},
      "Game 5" => {"red" => 7, "blue" => 3, "green" => 5}
    }
      expect(build_totals_hash(test_lines)).to eq(expected_output)
    end
  end
end

