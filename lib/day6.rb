
class Day6
  def self.load_data(file)
    raw = File.read(file)
    raw.split(',').map(&:to_i)
  end

  def self.calc_fish(fish_arr, days)
    # 9 buckets to hold the count of fish with each of the 9 possible numbers
    buckets = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    fish_arr.each do |fish|
      buckets[fish] = buckets[fish] + 1
    end

    days.times do
      # The zeros are about to pop. Let's save their count
      new_fish = buckets[0]
      (1..8).each do |i|
        # Put each of the counts into a new, lower bucket
        buckets[i - 1] = buckets[i]
      end
      # Each of the zeros will become a six...
      buckets[6] = buckets[6] + new_fish
      # And they'll form a new 8 bucket
      buckets[8] = new_fish
    end
    puts(buckets.sum)
    buckets.sum
  end
end
