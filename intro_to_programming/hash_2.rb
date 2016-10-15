hash_one = { father: "Baba", mother: "Mom" }
hash_two = { sister: "Neha" }

merge_regular = hash_one.merge(hash_two)

puts "Regular merge returns a new hash: #{merge_regular}
      but the original still exists: #{hash_one}"

hash_one_d = { father: "Baba", mother: "Mom" }
hash_two_d = { sister: "Neha" }

merge_destroy = hash_one_d.merge!(hash_two_d)
puts "Destructive merge returns a new hash: #{merge_destroy}
      but original is now: #{hash_one_d}"
