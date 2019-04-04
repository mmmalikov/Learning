require_relative 'carriage'

class PassengerCar < Carriage
  def valid_car?(new_car)
    new_car.is_a?(PassengerCar)
  end

  def occupy(_size)
    super(1)
  end
end
