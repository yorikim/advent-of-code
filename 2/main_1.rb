def parse_rule(rule)
  numbers, char = rule.split(' ').map(&:strip)
  min, max = numbers.split('-').map(&:to_i)
  [min, max, char]
end

result = File.readlines('./input_1.txt').inject(0) do |counter, line|
  rule, str = line.split(':').map(&:strip)
  min, max, char = parse_rule(rule)

  char_count = str.chars.select { |c| c == char }.size
  counter += 1 if char_count.between?(min, max)
  counter
end

pp result
