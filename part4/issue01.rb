class Train
  attr_accessor :number
  attr_accessor :type
  def initialize(number, type, count_of_cars)
    @number = number
    @type = type
    @count_of_cars = count_of_cars
    @speed = 0
  end

  def route(new_route)
    puts "route of #{@number} is changed"
    @route = new_route
    @station_number = 0
  end

  def current_station
    @route.station(@station_number).name if @route
  end

  def next_station
    if @route
      return 'On the last station!' unless last_station?
      @route.station(@station_number + 1).name
    else
      false
    end
  end

  def prev_station
    if @route
      return puts 'On the first station!' unless @station_number.nonzero?
      @route.station(@station_number - 1).name
    else
      puts 'no route!'
    end
  end

  def move_next
    if @route
      return puts 'you are in the end!' unless @station_number != @route.size
      @station_number += 1
    else
      puts 'no route!'
    end
  end

  def move_prev
    if @route
      return puts 'On the first station!' unless @station_number.nonzero?
      @station_number -= 1
    else
      puts 'no route!'
    end
  end

  def speed
    puts "speed of train is #{@speed}"
  end

  def up_speed
    puts 'Up speed! too! too!'
    @speed += 60
  end

  def stop
    puts 'Train is stoped'
    @speed = 0
  end

  def count_of_cars
    @count_of_cars
  end

  def add_car
    if @speed.zero?
      @count_of_cars += 1
      puts "car is added. count of cars: #{@count_of_cars}"
    else
      puts 'can not add a car on the move'
    end
  end

  def delete_car
    if @speed.zero? && @count_of_cars >= 1
      @count_of_cars -= 1
      puts "car is added. count of cars: #{@count_of_cars}"
    else
      puts 'can not add a car'
    end
  end

  def last_station?
    @station_number + 1 == @route.size
  end
end

class Station
  attr_accessor :name
  def initialize(name)
    @name = name
    @list_of_trains = []
  end

  def get_train(train)
    @list_of_trains.insert(train)
  end

  def list_of_trains
    puts 'List of trains'
    @list_of_trains.each { |train| puts "train  No #{train.number}, type #{train.type}" }
  end

  def get_list_of_trains(type)
    puts "List of trains type #{type}"
    @list_of_trains.each do |train|
      puts "train  No #{train.number}, type #{train.type}" if train.type == type
    end
  end

  def send_train(train)
    if train.next_station
      puts "train #{train.number} is going to #{train.next_station}"
      train.move_next
      @list_of_trains.delete(train)
    else
      puts 'no route'
    end
  end
end

class Route
  def initialize(from, to)
    @stations = [from, to]
  end

  def add_station(station, order)
    if order <= @stations.size
      @stations.insert(order, station)
      puts "#{station.name} is in the route"
    else
      puts 'Station is not in the route'
    end
  end

  def delete_station(station)
    @stations.delete_if { |x| x == station }
  end

  def list
    puts 'Stations in this route:'
    @stations.each { |station| puts station.name }
  end

  def station(number)
    @stations[number]
  end

  def size
    @stations.size
  end
end
