class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end


  def add_food_truck(food_truck)  
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item1)
    if @food_trucks.include?(item1)
      p @food_trucks
    end
  end
end
