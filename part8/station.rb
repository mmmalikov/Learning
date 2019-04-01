class Station
  attr_accessor :name

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
    @@stations.push(self)
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

  protected

  def validate!
    raise "Name of station can't be empty" unless name
    raise 'Name of station should be at least 3 symbols' if name.length < 3
    true
  end

  private

  def list_of_trains_by(type)
    @trains.each do |train|
      @trains_by_type << train if train.type == type
    end
  end
end
