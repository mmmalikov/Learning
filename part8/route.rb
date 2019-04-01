class Route
  def initialize(from, to)
    @stations = [from, to]
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def add_station(station, order)
    if order <= @stations.size
      @stations.insert(order, station)
    else
      puts 'Station is not in the route'
    end
  end

  def delete_station(station)
    @stations.delete_if { |x| x == station }
  end

  def list
    list = @stations.each_with_object("") do |station, list|
      list << "[#{@stations.index(station)}] #{station.name}, "
    end
    list
  end

  def station(number)
    return @stations[number] if @stations[number]
  end

  def size
    @stations.size
  end

  protected

  def validate!
    raise 'No or invalid start station' unless @stations[0].is_a?(Station)
    raise 'No or invalid finish station' unless @stations[1].is_a?(Station)
  end
end
