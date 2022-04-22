class CargoWagon < Wagon
  attr_reader :volume, :occupied_volume

  def initialize(volume)
    @volume = volume
    @type = :cargo
    @occupied_volume = 0
  end

  def take_volume(volume)
    @occupied_volume += volume unless free_volume < volume
  end

  def free_volume
    @volume - @occupied_volume
  end
end
