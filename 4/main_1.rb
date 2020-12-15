REQUIRED_FIELDS = %w[byr iyr eyr hgt hcl ecl pid]

counter = 0

def all_fields?(data)
  (REQUIRED_FIELDS - data.keys).empty?
end

current_data = {}
File.readlines('./input_1.txt').map(&:strip).each do |line|
  if line.empty?
    counter += 1 if all_fields?(current_data)
    current_data = {}
    next
  end

  current_data = line.split(' ').reduce(current_data) do |data, var|
    name, value = var.split(':')
    data[name] = value
    data
  end
end

counter += 1 if all_fields?(current_data)

pp counter
