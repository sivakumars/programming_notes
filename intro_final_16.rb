a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

b = []

a.each do |phrase|
  b.push(phrase.split(" ")).flatten!
end

p b
