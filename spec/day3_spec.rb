require_relative '../Day3/day3'

describe 'is_symbol?' do
  it 'returns true for symbols' do
    expect(is_symbol?('#')).to be true
    expect(is_symbol?('.')).to be false
    expect(is_symbol?('!')).to be true
  end

  it 'returns false for non-symbols' do
    expect(is_symbol?('A')).to be false
    expect(is_symbol?('1')).to be false
  end
end

describe 'is_digit?' do
  it 'returns true for digits' do
    expect(is_digit?('0')).to be true
    expect(is_digit?('5')).to be true
    expect(is_digit?('9')).to be true
  end

  it 'returns false for non-digits' do
    expect(is_digit?('A')).to be false
    expect(is_digit?('#')).to be false
    expect(is_digit?(' ')).to be false
  end
end

describe 'number_adjacent_to_symbol?' do
  it 'returns true if there is a symbol adjacent to the number' do
    grid = [
      ['1', '#', '2'],
      ['3', '4', '5'],
      ['6', '4', '7']
    ]
    expect(number_adjacent_to_symbol?(grid, 0, 0)).to be true
    expect(number_adjacent_to_symbol?(grid, 1, 1)).to be true
    expect(number_adjacent_to_symbol?(grid, 1, 2)).to be true
  end

  it 'returns false if there is no symbol adjacent to the number' do
    grid = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9']
    ]
    expect(number_adjacent_to_symbol?(grid, 0, 0)).to be false
    expect(number_adjacent_to_symbol?(grid, 1, 1)).to be false
    expect(number_adjacent_to_symbol?(grid, 2, 2)).to be false
  end
end

describe 'sum_part_numbers_from_file' do
  it 'returns the correct sum of part numbers' do

    filename = 'Day3/input.txt'
    expect(sum_part_numbers_from_file(filename)).to eq(531561)
  end
end
