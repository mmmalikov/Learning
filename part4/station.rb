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
