require_relative './station'
require_relative './route'
require_relative './cargo_train'
require_relative './passenger_train'
require_relative './passenger_car'
require_relative './cargo_car'

class Railway
  def initialize
    @stations = []
    @trains = []
    @routes = []
    puts 'Welcome to The Railway!'
  end

  def new_station(name)
    station = Station.new(name)
    @stations << station
  end

  def new_c_train
    train = CargoTrain.new(@trains.size)
    @trains << train
    @trains.last.number
  end

  def new_p_train
    train = PassengerTrain.new(@trains.size)
    @trains << train
    @trains.last.number
  end

  def set_route(train_number, route_number)
    if train_number < @trains.size && route_number < @routes.size
      @trains[train_number].route(@routes[route_number])
      @routes[route_number].station(0).get_train(@trains[train_number])
      @routes[route_number].list + ' is set'
    else
      ' is not set, one of arguments is wrong'
    end
  end

  def new_route(from, to)
    if from < @stations.size + 1 && to < @stations.size + 1
      route = Route.new(@stations[from], @stations[to])
      @routes << route
      @routes.last.list
    end
  end

  def routes
    @routes
  end

  def route(number)
    @routes[number].list
  end

  def add_in_route(route_number, station_number, order)
    if @stations[station_number] && @routes[route_number]
      @routes[route_number].add_station(@stations[station_number], order)
      @routes[route_number].list
    else
      'Error!'
    end
  end

  def delete_from_route(route_number, station_number)
    if station_number < @routes[route_number].size && route_number < @routes.size
      @routes[route_number].delete_station(@stations[station_number])
      @routes[route_number].list
    else
      'Error!'
    end
  end

  def size_of(train)
    train.count_of_cars
  end

  def add_car_to(train_number)
    if @trains[train_number].is_a?(PassengerTrain)
      @trains[train_number].add_car(PassengerCar.new)
      @trains[train_number].number
    end
    if @trains[train_number].is_a?(CargoTrain)
      @trains[train_number].add_car(CargoCar.new)
      @trains[train_number].number
    end
  end

  def delete_car_from(train_number)
    @trains[train_number].delete_car
  end

  def current_station(train_number)
    @trains[train_number].current_station
  end

  def go_next(train_number)
    if train_number <= @trains.size && @trains[train_number].next_station
      @trains[train_number].current_station.send_train(@trains[train_number])
      next_station = @trains[train_number].move_next
      next_station.get_train(@trains[train_number])
    end
  end

  def go_prev(train_number)
    if (train_number <= @trains.size) && @trains[train_number].current_station
      @trains[train_number].current_station.send_train(@trains[train_number])
      previous_station = @trains[train_number].move_prev
      previous_station.get_train(@trains[train_number])
    end
  end

  def list_of_trains(number_of_station)
    if number_of_station <= @stations.size - 1
      @stations[number_of_station].list_of_trains
    end
  end

  def list_of_all_trains
    @trains
  end

  def list_of_stations
    @stations
  end
end
