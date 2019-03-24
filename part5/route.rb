class Route
  def initialize(from, to)
    @stations = [from, to]
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
    list = ''
    @stations.each_with_index { |station, index| list+="[#{index}] #{station.name}, " }
    list
  end

  def station(number)
    return @stations[number] unless @stations[number].nil?
  end

  def size
    @stations.size
  end
end
