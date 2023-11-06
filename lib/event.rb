class Event 
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.include?(item)
    end
  end

  def sorted_item_list
    @food_trucks.flat_map do |food_truck|
       food_truck.inventory.map do |item, quantity|
       item.name
      end
    end.uniq.sort
  end
end