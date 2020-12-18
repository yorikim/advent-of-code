N = 25

numbers = []
sums = []

File.readlines('./input.txt').map(&:to_i).each_with_index do |number, index|
  if numbers.size < (N - 1)
    numbers << number
    next
  end

  if index == (N - 1)
    numbers << number
    numbers.each_with_index do |a, i|
      numbers.each_with_index do |b, j|
        sums << a + b if j > i
      end
    end

    next
  end

  if sums.include?(number)
    sums.shift(N - 1)
    numbers.shift

    numbers.each_with_index do |a, i|
      sums.insert(N - 1 + i * N , a + number)
    end
    numbers << number

    next
  end

  pp number
  break
end
