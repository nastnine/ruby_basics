puts "Введите число"
number = gets.chomp.to_i
puts "Введите месяц"
month = gets.chomp.to_i
puts "Введите год"
year = gets.chomp.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
answer = 0
answer += number

for n in 0..month - 2
  answer += months[n]
end

if year % 4 == 0
  answer += 1
elsif year % 100 == 0 && year % 400 == 0
  answer += 1
end

puts "#{answer}"
