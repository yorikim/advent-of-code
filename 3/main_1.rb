lines = File.readlines('./input_1.txt').map(&:strip).map { |line| line * 100 }

x, y = 0, 0
counter = 0

(lines.size - 1).times do
  x += 3
  y += 1
  counter += 1 if lines[y][x] == '#'
end

pp counter
