words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

character_hash = {}
result = {}

words.each do |word|
  character_hash[word] = word.split('').sort
end

character_hash.each_with_index do |(key,value),index|
  result[key] = []
  comparison_index = 0
  while comparison_index < character_hash.length
    if character_hash.values[index] == character_hash.values[comparison_index]
      result[key].push(character_hash.keys[comparison_index])
    end
    comparison_index += 1
  end
end

p result.values.uniq
