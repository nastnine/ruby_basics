class Wagon
  include Manufacturer
  attr_reader :type, :space, :taken_space

  def initialize(space)
    @space = space 
    @taken_space = 0
  end 

  def take_space(volume) 
    @taken_space += volume unless free_space < volume  
  end 

  def free_space
    @space - @taken_space
  end       
end
