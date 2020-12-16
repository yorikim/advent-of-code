lines = []

File.readlines('./input.txt').map(&:strip).each_with_index do |line, index|
  command, value = line.split(' ')
  lines << {
    command: command,
    value: value.to_i,
    executed: false
  }
end

result = 0

current_index = 0
loop do
  line = lines[current_index]

  command, value, executed = line[:command], line[:value], line[:executed]
  break if executed

  if command == 'jmp'
    current_index += value
  else
    if command == 'acc'
      result += value
    end

    current_index += 1
  end

  line[:executed] = true
end

pp result
