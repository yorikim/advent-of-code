lines = File.readlines('./input_2.txt').map(&:strip).map { |line| line * 10000 }

steps = [{
  x: 1,
  y: 1,
  counter: 0
}, {
  x: 3,
  y: 1,
  counter: 0
}, {
  x: 5,
  y: 1,
  counter: 0
}, {
  x: 7,
  y: 1,
  counter: 0
}, {
  x: 1,
  y: 2,
  counter: 0
}]

steps.each do |step|
  x, y = 0, 0

  (lines.size - 1).times do
    x += step[:x]
    y += step[:y]
    next if y >= lines.size

    step[:counter] += 1 if lines[y][x] == '#'
  end
end

result = steps.inject(1) do |sum, step|
  sum * step[:counter]
end

pp result
