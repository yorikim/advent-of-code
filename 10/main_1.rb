hash = { 1 => 0, 3 => 0 }

numbers = File.readlines('./input.txt').map(&:to_i).sort
inserted = [0]
numbers.each do |num|
  if inserted.include?(num - 1)
    hash[1] += 1
  else
    hash[3] += 1
  end
  inserted << num
end

hash[3] += 1

pp hash[1] * hash[3]
