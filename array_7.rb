arr = [1, 2, 3, 4, 5]

def magic(array)
  p array
  p array.map { |value| value + 2 }
end

magic(arr)
