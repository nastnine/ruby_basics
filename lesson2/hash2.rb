hash = {}
vowels = ['a', 'e', 'i', 'o', 'u', 'y']
letters = ('a'.."z").to_a

letters.each_with_index do |x, y|
  hash[x] = y+1 if vowels.include?(x)
end

puts hash
