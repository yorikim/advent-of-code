hash = {}

File.readlines('./input_1.txt').each do |line|
  number = line.to_i

  sub = 2020 - number
  if hash.key?(sub)
    pp number * sub
    break
  end

  hash[number] = true
end
