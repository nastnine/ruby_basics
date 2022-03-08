puts "Введите коэффициент а"
a = gets.chomp.to_i
puts "Введите коэффициент b"
b = gets.chomp.to_i
puts "Введите коэффициент с"
с = gets.chomp.to_i

d = b**2-4*a*c
if d < 0
  puts "Дискриминант равен #{d}, Корней нет"
elsif d == 0
  x = -b / (2 * a)
  puts "Дискриминант равен #{d}, корень уравнения равен #{x}"
else
  x_1 = (-b + Math.sqrt(d)) / (2 * a)
  x_2 = (-b - Math.sqrt (d)) / (2 * a)
  puts "Дискриминант равен #{d}. Два корня уравнения #{x_1} и #{x_2}"
end
