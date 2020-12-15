REQUIRED_FIELDS = {
  'byr' => /^(?<value>\d{4})$/,
  'iyr' => /^(?<value>\d{4})$/,
  'eyr' => /^(?<value>\d{4})$/,
  'hgt' => /^(?<value>\d{2,3}(?<type>(cm|in){1}))$/,
  'hcl' => /^#[0-9a-f]{6}$/,
  'ecl' => /^(amb|blu|brn|gry|grn|hzl|oth){1}$/,
  'pid' => /^[0-9]{9}$/
}

RANGE_FIELDS = {
  'byr' => {
    min: 1920,
    max: 2002
  },
  'iyr' => {
    min: 2010,
    max: 2020
  },
  'eyr' => {
    min: 2020,
    max: 2030
  },
  'hgt' => {
    min: 999999999999999,
    max: -99999999999999
  },
  'hgtcm' => {
    min: 150,
    max: 193
  },
  'hgtin' => {
    min: 59,
    max: 76
  },
}

def all_fields_valid?(data)
  return false unless (REQUIRED_FIELDS.keys - data.keys).empty?

  REQUIRED_FIELDS.each do |field, regex|
    m = data[field].match(regex)
    return false unless m

    if RANGE_FIELDS.key?(field)
      range_key = field
      range_key = "#{field}#{m[:type]}" if field == 'hgt'

      return false unless m[:value].to_i.between?(RANGE_FIELDS[range_key][:min], RANGE_FIELDS[range_key][:max])
    end
  end

  true
end

current_data = {}
counter = 0

File.readlines('./input_2.txt').map(&:strip).each do |line|
  if line.empty?
    counter += 1 if all_fields_valid?(current_data)
    current_data = {}
    next
  end

  current_data = line.split(' ').reduce(current_data) do |data, var|
    name, value = var.split(':')
    data[name] = value
    data
  end
end

counter += 1 if all_fields_valid?(current_data)

pp counter
