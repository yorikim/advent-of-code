require 'set'

answers = Set.new

result = 0
File.readlines('./input.txt').map(&:strip).each do |line|
  answers += line.chars

  if line.empty?
    result += answers.size
    answers = Set.new
    next
  end
end

result += answers.size

pp result
