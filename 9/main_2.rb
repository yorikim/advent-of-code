N = 25

queue = []
sums = []
invalid_number = nil

numbers = File.readlines('./input.txt').map(&:to_i)
numbers.each_with_index do |number, index|
  if queue.size < (N - 1)
    queue << number
    next
  end

  if index == (N - 1)
    queue << number
    queue.each_with_index do |a, i|
      queue.each_with_index do |b, j|
        sums << a + b if j > i
      end
    end

    next
  end

  if sums.include?(number)
    sums.shift(N - 1)
    queue.shift

    queue.each_with_index do |a, i|
      sums.insert(N - 1 + i * N, a + number)
    end
    queue << number

    next
  end

  invalid_number = number
  break
end

numbers.each_with_index do |a, i|
  sum = a
  (i + 1).upto(numbers.size - 1) do |j|
    sum += numbers[j]
    if sum == invalid_number
      min, max = numbers[i], numbers[j]
      i.upto(j) do |k|
        min = [numbers[k], min].min
        max = [numbers[k], max].max
      end

      pp min + max
      break
    end
  end
end
