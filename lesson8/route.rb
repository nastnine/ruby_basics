class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    register_instance 
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
