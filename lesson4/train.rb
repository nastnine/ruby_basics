class Train
  attr_reader  :number, :type, :wagons, :speed, :route

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
  end

  def go
    self.speed += 10
  end

  def stop
    self.speed = 0
  end

  def right_wagon?(wagon)
    wagon.type == self.type
  end

  def add_wagon(wagon)
    self.wagons << wagon if self.speed == 0 && right_wagon?(wagon)
  end

  def delete_wagon(wagon)
    self.wagons.delete(wagon) if self.speed == 0
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

  def previous_station
    route.stations[@current_station_index - 1]
  end

  def go_next
    if next_station
      current_station.send_train(self)
      go
      @current_station_index += 1
    end
  end

  def go_previous
    if pr_station
      current_station.send_train(self)
      go
      @current_station_index -= 1
    end
  end
end
