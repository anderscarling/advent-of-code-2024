data = DATA.read.split.map(&:to_i)

blink = ->(stone) do
  return 1 if stone == 0

  stone_str = stone.to_s
  return stone * 2024 unless stone_str.length.even?

  [stone_str[0, stone_str.length/2].to_i, stone_str[stone_str.length/2..].to_i]
end

do_blinks = ->(iters) do
  iters.times.inject(data) do |stones, n|
    stones.flat_map(&blink)
  end
end


# Part 1

res1 = do_blinks.(25)
puts "Part 1: #{res1.size}"

# Part 2

# res2 = do_blinks.(75)
# puts "Part 2: #{res2.size}"

__END__
20 82084 1650 3 346355 363 7975858 0
