hash = {}

numbers = File.readlines('./input_2.txt').map { |line| line.to_i }
numbers.each_with_index do |a, i|
  numbers.each_with_index do |b, j|
    next if i == j

    hash[a + b] = [a, b]
  end
end

numbers.each do |number|
  sub = 2020 - number
  if hash.key?(sub)
    pp number * hash[sub].first * hash[sub].last
    break
  end
end
