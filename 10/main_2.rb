@result = 0

hash = { 0 => 1 }
numbers = File.readlines('./input.txt').map(&:to_i).sort

numbers.each do |num|
  hash[num] = 0
  (1..3).to_a.each do |k|
    if hash.key?(num - k)
      hash[num] += hash[num - k]
    end
  end
end

pp hash[hash.keys.max]
