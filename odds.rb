


arr = []
i = 1
until arr.length == 100
  arr << i if i%2 != 0
  i += 1
end

puts arr.inject(:+)
