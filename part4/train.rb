class Train
  attr_accessor :number
  attr_accessor :type
  attr_reader :count_of_cars
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
      return puts 'On the first station!' if @station_number.zero?
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
      return puts 'On the first station!' if @station_number.zero?
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
