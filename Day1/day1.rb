# PART ONE
# Iterate over the file and transform each line into a string in an array with newline characters removed
lines = File.readlines('Day1/input.txt').map(&:chomp)

# Transform each string in the array and extract digits
digit_pairs = lines.map do |str|
  digits = str.scan(/\d/)  # Extract all digits from the string

  if digits.empty?
    nil  # or handle non-digit strings as needed
  elsif digits.length == 1
    digits.first * 2  # Double the digit if it's the only one
  else
    digits.first + digits.last  # Concatenate the first and last digit
  end
end

sum = digit_pairs.map(&:to_i).sum  # Convert each string to an integer and sum them

p sum # => 55123 The sum of all the calibrations