require 'set'

answers = Set.new
is_new = true
result = 0

File.readlines('./input.txt').map(&:strip).each do |line|
  if line.empty?
    result += answers.size
    answers = Set.new
    is_new = true
    next
  end

  if is_new
    answers = line.chars
    is_new = false
  else
    answers &= line.chars
  end
end

result += answers.size

pp result
