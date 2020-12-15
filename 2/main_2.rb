def parse_rule(rule)
  numbers, char = rule.split(' ').map(&:strip)
  first, second = numbers.split('-').map(&:to_i)
  [first, second, char]
end

result = File.readlines('./input_2.txt').inject(0) do |counter, line|
  rule, str = line.split(':').map(&:strip)
  first, second, char = parse_rule(rule)

  counter += 1 if ([str[first - 1], str[second - 1]].select { |c| c == char }.size == 1)
  counter
end

pp result
