require_relative './validation'

class Station
  include Validation

  FORMAT_NAME = /^[a-z]$/i

  attr_accessor :name
  validate :name, :presence
  validate :name, :format, FORMAT_NAME

  @@stations = []

  class << self
    def all
      @@stations
    end
  end

  def initialize(names)
    @name = names
    validate!
    @trains = []
    @@stations << self
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  def valid?
    validate!
  rescue
    false
  end

  def get_train(train)
    @trains.push(train) if train.is_a?(Train)
  end

  def send_train(train)
    @trains.delete(train) if train.is_a?(Train)
  end

  def list_of_trains
    @trains
  end

  private

  def list_of_trains_by(type)
    @trains.each do |train|
      @trains_by_type << train if train.type == type
    end
  end
end
