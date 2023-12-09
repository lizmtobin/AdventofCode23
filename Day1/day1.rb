# Variables
lines = File.readlines('Day1/input.txt').map(&:chomp)
NAMED_NUMBERS = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"].freeze
pattern = /(#{NAMED_NUMBERS.join('|')})/

SPECIAL_CASES = {
  "oneight"     => "18",
   "twone"      => "21",
   "threeight"  => "38",
   "fiveight"    => "58",
   "sevenine"   => "79",
   "eightwo"    => "82",
   "eighthree"  => "83",
   "nineight"   => "98"
}

def generate_adjoining_words
  named_num = NAMED_NUMBERS - ["zero"]
  combinations = []
  named_num.each do |first_word|
    named_num.each do |second_word|
      if first_word[-1] == second_word[0]
        combined_word = first_word + second_word[1..]
        combinations << combined_word
      end
    end
  end
  combinations.uniq
end

def word_to_number(word)
  NAMED_NUMBERS.index(word).to_s
end

def digitise_input(lines, pattern)
  # Handle special cases first
  lines.map do |str| 
    special_handled = str.dup
      SPECIAL_CASES.each do |word, number|
      special_handled.gsub!(word, number)
    end

      special_handled.gsub(pattern) do |word| 
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

# generate_adjoining_words - returns an array of all possible combinations of adjoining words

total = sum_digits(lines, pattern)
p total