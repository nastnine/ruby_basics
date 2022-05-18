class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@all << self
    register_instance
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
    end
    puts "Пассажирские поезда #{passenger_train}, Грузовые поезда #{cargo_train}"
  end

  def send_train(train)
    @trains.delete(train)
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def each_train(&block)
    @trains.each(&block)
  end

  private

  def validate!
    raise 'Station name is short!' if name.length < 2
  end
end
