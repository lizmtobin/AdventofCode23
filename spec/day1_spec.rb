require_relative '../Day1/day1.rb'

describe 'word_to_number' do
  it 'converts word representations of numbers to actual numbers' do
    expect(word_to_number('one')).to eq("1")
    expect(word_to_number('five')).to eq("5")
    expect(word_to_number('nine')).to eq("9")
  end
end

describe 'digitise_input' do
  it 'reads lines from input file and converts them to arrays of digits' do
    file = %w(five3onelxjninenine45 six9mnfjmtsf2kfmznkxntninesevenrpmfjfpgsk 9vkrmbpnine5two5cbktwo6)
    pattern = /(#{NAMED_NUMBERS.join('|')})/
    expect(digitise_input(file, pattern)).to eq(["531lxj9945", "69mnfjmtsf2kfmznkxnt97rpmfjfpgsk", "9vkrmbp9525cbk26"])
  end
end

describe 'collect_first_and_last_num' do
  it 'collects the first and last digits from array' do
    converted_lines = ["531lxj9945", "69mnfjmtsf2kfmznkxnt97rpmfjfpgsk", "9vkrmbp9525cbk26"]
    pattern = /(#{NAMED_NUMBERS.join('|')})/
    expect(collect_first_and_last_num(converted_lines, pattern)).to eq(["55", "67", "96"])
  end
end

describe 'sum_digits' do
  it 'sums up all the digits in the given array' do
    numbered_lines = ["55", "67", "96"]
    pattern = /(#{NAMED_NUMBERS.join('|')})/
    expect(sum_digits(numbered_lines, pattern)).to eq(218)
  end
end
