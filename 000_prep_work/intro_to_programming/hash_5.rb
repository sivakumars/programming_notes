
def does_hash_contain(hash, value)
  if hash.has_value?(value)
    p "Yes, the hash contains #{value}"
  else
    p "No, the hash does not contain #{value}"
  end
end


family = { father: "Baba", mother: "Mom", sister: "Neha"}
does_hash_contain(family, "father")
does_hash_contain(family, "Baba")
