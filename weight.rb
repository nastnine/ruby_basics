puts "Как тебя зовут?"
name = gets.chomp

puts "Какой твой рост?"
height = gets.chomp

ideal_weight = (height.to_i - 110) * 1.15
if ideal_weight < 0
  puts "#{name}, Ваш вес уже оптимальный"
else
  puts "#{name}, твой идеальный вес #{ideal_weight}"
end
