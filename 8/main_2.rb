lines = []

File.readlines('./input.txt').map(&:strip).each_with_index do |line, index|
  command, value = line.split(' ')
  lines << {
    command: command,
    value: value.to_i,
    executed: false
  }
end

def calc_result(dup)
  current_index = 0
  result = 0

  loop do
    return  result if current_index == dup.size

    line = dup[current_index]

    command, value, executed = line[:command], line[:value], line[:executed]
    return nil if executed

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
end

switcher = ['nop', 'jmp', 'nop']

lines.each_with_index do |line, index|
  next if line[:command] == 'acc'

  dup = Marshal.load(Marshal.dump(lines))
  dup[index][:command] = switcher[switcher.find_index { |command| command == dup[index][:command] } + 1]

  result = calc_result(dup)
  if result
    pp result
    break
  end
end
