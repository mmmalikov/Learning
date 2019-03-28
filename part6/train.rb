require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter
  attr_accessor :number
  @@trains = {}

  class << self
    def find(number)
      @@trains[number]
    end
  end

  def initialize(number)
    @number = number
    @cars = []
    @count_of_cars = 0
    @speed = 0
    @@trains[number] = self
    register_instance
  end

  def route(new_route)
    @route = new_route
    @station_number = 0
  end

  def move_next
    if @route
      if @station_number < @route.size
        @station_number += 1
        @route.station(@station_number)
      end
    else
      nil
    end
  end

  def move_prev
    if @route
      if @station_number >= 1
        @station_number -= 1
        @route.station(@station_number)
      end
    else
      nil
    end
  end

  def count_of_cars
    @cars.size
  end

  def delete_car
    unless @cars.empty?
      @cars.delete(@cars.last)
    end
  end

  def current_station
    return @route.station(@station_number) if @route
  end

  def next_station
    if @route && @station_number < @route.size - 1
      @route.station(@station_number + 1)
    end
  end

  def prev_station
    if @route && @station_number > 0
      @route.station(@station_number - 1)
    else
      return nil
    end
  end

  def add_car(new_car)
    if valid_car?(new_car)
      @cars.push(new_car)
    end
  end

  protected

  # вызывается из классов-наследников
  def valid_car?(new_car);
  end

  private

  # не используем этот метод
  def speed
    @speed
  end

  # этот метод описывает внутреннее поведение объекта
  def up_speed
    @speed += 60
  end

  # этот метод описывает внутреннее поведение объекта
  def stop
    @speed = 0
  end
end
