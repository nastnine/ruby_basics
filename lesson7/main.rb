require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class Interface
  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  def menu
    puts(<<~EOF)
      Выберете действие:
      Нажмите 1, если хотите создать станцию
      Нажмите 2, если хотите создать поезд
      Нажмите 3, если хотите создать маршрут
      Нажмите 4, если хотите добавить станцию в маршрут
      Нажмите 5, если хотите удалить станцию из маршрута
      Нажмите 6, если хотите назначить маршрут поезду
      Нажмите 7, если хотите добавить вагон к поезду
      Нажмите 8, если хотите отцепить вагон от поезда
      Нажмите 9, если хотите переместить поезд
      Нажмите 10, если хотите просмотреть список станций и поездов на станции
    EOF

    loop do
      action = gets.to_i
      case action
      when 1
        new_station
      when 2
        new_train
      when 3
        add_route
      when 4
        add_station_to_route
      when 5
        delete_station_from_route
      when 6
        add_route_to_train
      when 7
        add_wagon
      when 8
        delete_wagon
      when 9
        move_train
      when 10
        show_train_and_station
      else
        puts "Error!"
      end
    end
  end

  private  # меню доступно ото всюду, другие методы ограничены(доступны только внутри класса)
          #private, тк класс без наследников
  def new_station
    puts "Введите имя станции"
    station = gets.chomp
    @stations << Station.new(station)
    puts "Создана #{station} станция"
  rescue StandardError => e
    puts e.message
    retry
  end

  def new_train
    puts "Введите номер поезда"
    number = gets.to_i
    puts "Введите тип поезда: пассажирский(1) или грузовой(2)"
    type = gets.to_i
    case type
    when 1
      @trains << PassengerTrain.new(number)
    when 2
      @trains << CargoTrain.new(number)
    else
      puts "Error!"
    end
    puts "Создан #{number} поезд"
  rescue StandardError => e
    puts e.message
    retry
  end

  def add_wagon
    show_array(trains)
    puts "Выберете поезд"
    selected_train = select_from_array(trains)
    retern if selected_train.nil?

    if selected_train.is_a?(PassengerTrain)
      selected_train.add wagon(PassengerWagon.new)

    elsif selected_train.is_a?(CargoTrain)
      selected_train.add_wagon(CargoWagon.new)
    end
  end

  def delete_wagon
    show_array(trains)
    puts "Выберете поезд"
    selected_train = select_from_array(trains)
    retern if selected_train.nil?

    selected_train.delete_wagon
  end

  def show_array(array)
    array.each_with_index do |name, index|
      next if index == 0
      puts "#{index} - #{name}"
    end
  end

  def select_from_array(array)
    index = gets.to_i - 1
    array[index]
  end

  def add_route
    puts "Введите имя начальной станции маршрута"
    first_name = gets.chomp
    puts "Введите имя конечной станции маршрута"
    last_name = gets.chomp
    @routes << Route.new(first_name, last_name)
    puts "Вы создали маршрут #{@routes}"
  rescue StandardError => e
    puts e.message
    retry   
  end

  def add_station_to_route
    if @routes.empty?
      puts "Вы не создали маршрут"
    else
      show_array(routes)
      puts "Выберете маршрут"
      selected_route = select_from_array(routes)
      return if selected_route.nil?

      show_array(stations)
      puts "Выберете станцию, чтобы добавить в маршрут"
      selected_station = select_from_array(stations)
      selected_route.add_station(selected_station)
    end
  end

  def delete_station_from_route
     show_array(routes)
     puts "Выберете маршрут"
     selected_route = select_from_array(routes)
     show_array(selected_route.stations)

     puts "Выберете станцию, чтобы удалить из маршрута"
     selected_station = select_from_array(selected_route.stations)
     selected_route.delete_station(selected_station)
   end

   def add_route_to_train
     if @trains.empty?
       puts "Поездов нет"
     elsif @routes.empty?
       puts "Нет таких маршрутов"
     else
       puts "Выберете поезд"
       selected_train = select_from_array(trains)
       puts "Выберете маршрут"
       selected_route = select_from_array(routes)
       selected_train.route(selected_route)
     end
   end

  def move_train
    if @trains.empty?
      puts "Таких поездов нет"
    else
      selected_train = select_from_array(trains)

      puts "Хотите перейти на следующую(1) или предыдущую(2) станцию"
      action = gets.to_i

      if action == 1
        selected_train.go_next
      elsif action == 2
        selected_train.go_previous
      else
        puts "Error!"
      end
    end
  end

  def show_train_and_station
    stations.each do |station|
      puts "Станции: #{station.name}"

      puts "Список поездов:"
      show_array(station.trains)
    end
  end

end
