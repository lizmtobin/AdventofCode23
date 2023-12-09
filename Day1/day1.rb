# Variables
lines = File.readlines('Day1/input.txt').map(&:chomp)
NAMED_NUMBERS = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"].freeze
pattern = /(#{NAMED_NUMBERS.join('|')})/

def word_to_number(word)
  NAMED_NUMBERS.index(word).to_s
end

def digitise_input(lines, pattern)
  lines.map do |str| 
    str.gsub(pattern) do |word| 
        word_to_number(word) 
      end
   end
end 

def collect_first_and_last_num(lines, pattern)
  digitised_lines = digitise_input(lines, pattern)
  digitised_lines.map do |numbers|
    digits = numbers.scan(/\d/) 
    if digits.empty?
      nil 
    elsif digits.length == 1
      digits.first * 2
    else
      digits.first + digits.last 
    end
  end
end

def sum_digits(lines, pattern)
  digit_pairs = collect_first_and_last_num(lines, pattern)
  digit_pairs.map(&:to_i).sum
end

total = sum_digits(lines, pattern)
p total
# p sum # => 55123 The sum of all the calibrations
