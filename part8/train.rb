require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter
  attr_accessor :number
  attr_reader :speed

  NUMBER_FORMAT = /[\w]{3}(\-)?[\w]{2}/

  @@trains = {}

  class << self
    def find(number)
      @@trains[number]
    end
  end

  def initialize(number)
    @number = number
    validate!
    @cars = []
    @count_of_cars = 0
    @speed = 0
    @@trains[number] = self
    register_instance
  end

  def each_car
    @cars.each_with_index { |car, index| yield(car, index) }
  end

  def valid?
    validate!
  rescue
    false
  end

  def route(new_route)
    @route = new_route
    @station_number = 0
  end

  def move_next
    return if @route.nil?
    return unless @station_number < @route.size

    @station_number += 1
    @route.station(@station_number)
  end

  def move_prev
    return if @route.nil?
    return unless @station_number >= 1

    @station_number -= 1
    @route.station(@station_number)
  end

  def count_of_cars
    @cars.size
  end

  def delete_car
    @cars.delete(@cars.last) unless @cars.empty?
  end

  def current_station
    @route.station(@station_number) if @route
  end

  def next_station
    @route.station(@station_number + 1) if @route && @station_number < @route.size - 1
  end

  def prev_station
    @route.station(@station_number - 1) if @route && @station_number > 0
  end

  def add_car(new_car)
    @cars.push(new_car) if valid_car?(new_car)
  end

  def occupy_place(volume)
    @cars.each { |car| break if car.occupy(volume) } unless @cars.empty?
  end

  protected

  # вызывается из классов-наследников
  def valid_car?(new_car); end

  def validate!
    raise 'Number of train cant be empty' if number.nil?
    raise 'Number of train should be at least 5 symbols' if number.length < 5
    raise "Number #{number} has invalid format" if number !~ NUMBER_FORMAT
  end

  private

  # этот метод описывает внутреннее поведение объекта
  def up_speed
    @speed += 60
  end

  # этот метод описывает внутреннее поведение объекта
  def stop
    @speed = 0
  end
end
