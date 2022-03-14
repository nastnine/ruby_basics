puts "Для выхода введите 'stop'"

basket = {}

loop do
  puts "Название: "
  name = gets.chomp
  break if name == "stop"

  puts "Количество: "
  quantity = gets.chomp.to_f

  puts "Стоимость: "
  price = gets.chomp.to_f

  basket[name] = {price => quantity}
end
  total_price = 0
  basket.each do |name, price|
    puts "#{name}: #{price.keys.first * price.values.first}"
    total_price += price.keys.first * price.values.first
  end
  puts "Сумма: #{total_price}"
