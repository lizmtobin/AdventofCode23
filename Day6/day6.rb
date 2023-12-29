# Wait for it
# There is a fixed amount of time
# you win if your boat goes further than the current record holder.
# You control the boat speed by the length of time you hold the button down.
# the boat's speed increases by one millimeter per millisecond.

# so...
# 1 mil = 1 * ms .. up to the time limit - mil
# 2 mil = 2 * ms up to the time limit - mil
# 3 mil = 3 * ms up to the time limit - mil
# 4 mil = 4 * ms up to the time limit - mil
# 5 mil = 5 * ms up to the time limit - mil

# Then collect the total possible variations for winning each combo. say 8.
# factor the totals

time     = %w(46807866).map(&:to_i)
distance = %w(214117714021024).map(&:to_i)

# array = time.zip(distance)

# new_rec_array = []

# array.each do |time, rec_distance|
#   new_rec = 0
#   time.times do |seconds_held|
#     distance = seconds_held * (time - seconds_held)
#     if distance > rec_distance
#       new_rec += 1
#     end
#   end
#   new_rec_array << new_rec
# end

# Take 2

time_intervals = %w(46807866).map(&:to_i)
distances = %w(214117714021024).map(&:to_i)

result_product = time_intervals.zip(distances).map do |time_interval, record_distance|
  (0...time_interval).count do |seconds_held|
    calculated_distance = seconds_held * (time_interval - seconds_held)
    calculated_distance > record_distance
  end
end.reduce(:*)

p result_product
# p new_rec_array.reduce(:*)
