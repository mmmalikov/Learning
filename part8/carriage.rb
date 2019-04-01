require_relative 'manufacturer'

class Carriage
  include Manufacturer

  attr_reader :volume, :occupied

  def initialize(volume)
    @volume = volume
    @occupied = 0
  end

  def free_space
    @volume - @occupied
  end

  def occupy(size)
    @occupied += size if @occupied + size <= @volume
  end
end
