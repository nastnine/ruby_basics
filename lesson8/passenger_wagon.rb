class PassengerWagon < Wagon
  attr_reader :seats, :taken_seats

  def initialize(seats)
    @seats = seats
    @type = :passenger
    @taken_seats = 0
  end

  def take_seats
    @taken_seats += 1 unless free_seats.zero?
  end

  def free_seats
    @seats - @taken_seats
  end   
end
