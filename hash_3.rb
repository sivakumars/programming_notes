family = { father: "Baba", mother: "Mom", sister: "Neha"}

def print_keys(hash)
  hash.each_key do |key|
    p "Key: #{key}"
  end
end

def print_values(hash)
  hash.each_value do |value|
    p "Value: #{value}"
  end
end

def print_keys_values(hash)
  hash.each do |k,v|
    p "Key: #{k}, Value: #{v}"
  end
end

print_keys(family)
print_values(family)
print_keys_values(family)
