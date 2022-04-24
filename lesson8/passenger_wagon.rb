class PassengerWagon < Wagon

  def initialize(space)
    super
    @type = :passenger
  end

  def take_space
    @taken_space += 1 unless free_space.zero?
  end   
  
end
