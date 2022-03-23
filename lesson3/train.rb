class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
  @stations.insert(-2, station)
  end

  def delete_station(station)
  @stations.delete(station)
  end

  def show_stations
  @stations.each { |station| puts station.name}
  end
end

class Station
  attr_reader  :name, :trains

  def initialize(name)
    @name = name
    @trains =[]
  end

  def add_train(train)
    @trains << train
  end

  def show_trains
    passenger_train = 0
    cargo_train = 0
    @trains.each do |train|
      if train.type == :passenger
        passenger_train += 1
      else
        cargo_train += 1
      end
      return {:passenger => passenger_train, :cargo => cargo_train}
      end
  end

  def send_train(train)
      @trains.delete(train)
  end
end

class Train
  attr_reader  :number, :type, :quantity_wagons, :speed, :route

  def initialize(number, type, quantity_wagons)
    @number = number
    @type = type
    @quantity_wagons = quantity_wagons
    @speed = 0
  end

  def go
    self.speed += 10
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    self.quantity_wagons += 1 if self.speed == 0
  end

  def delete_wagon
    self.quantity_wagons -= 1 if self.speed == 0
  end

  def route=(route)
    @route = route
    @current_station_index = 0
    current_station.add_train(self)
  end

  def current_station
    route.stations[@current_station_index]
  end

  def next_station
    route.stations[@current_station_index + 1]
  end

  def pr_station
    route.stations[@current_station_index - 1]
  end

  def go_next
    if next_station
      current_station.send_train(self)
      go
      @current_station_index += 1
    end
  end

  def go_pr
    if pr_station
      current_station.send_train(self)
      go
      @current_station_index -= 1
    end
  end
end 
