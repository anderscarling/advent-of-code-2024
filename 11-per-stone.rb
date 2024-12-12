data = DATA.read.split.map(&:to_i)

blink = ->(stone) do
  return 1 if stone == 0

  stone_str = stone.to_s
  return stone * 2024 unless stone_str.length.even?

  [stone_str[0, stone_str.length/2].to_i, stone_str[stone_str.length/2..].to_i]
end

do_blinks = ->(iters) do
  initial = data.map { |stone| [stone, iters] }
  extra = []
  res = 0
  while initial.any? || extra.any?
    if extra.any?
      # puts "Extra cnt #{extra.size} / res #{res}"
      stone, iters = *extra.pop
    else
      # puts "Initial cnt #{initial.size} / res #{res}"
      stone, iters = *initial.shift
    end

    1.upto(iters).inject(stone) do |stone, iter|
      stone1, stone2 = *blink.(stone)
      extra.push([stone2, iters - iter]) if stone2
      stone1
    end
    res += 1
  end

  res
end


# Part 1

res1 = do_blinks.(25)
puts "Part 1: #{res1}"

# Part 2

# res2 = do_blinks.(75)
# puts "Part 2: #{res2}"

__END__
20 82084 1650 3 346355 363 7975858 0
