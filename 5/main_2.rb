def bin_s(path, right_c, max)
  low, high = 0, max

  path.chars.each do |c|
    mid = low + (high - low) / 2
    if c == right_c
      low = mid + 1
    else
      high = mid - 1
    end
  end

  low
end

def find_row(path)
  bin_s(path, 'B', 127)
end

def find_col(path)
  bin_s(path, 'R', 7)
end

seats = []

File.readlines('./input_2.txt').map(&:strip).each do |line|
  row = find_row(line[0..6])
  col = find_col(line[7..9])
  seat_id = row * 8 + col
  seats << seat_id
end

seats.sort!

min, max = [seats.min, seats.max]
min.upto(max) do |val|
  pp val unless seats.include?(val)
end
