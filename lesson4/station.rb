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
