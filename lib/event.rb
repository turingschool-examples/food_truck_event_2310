class Event
  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    trucks = []
    @food_trucks.each do |truck|
      trucks << truck.name
    end
    trucks
  end

  def food_trucks_that_sell(item)
    
  end
end
