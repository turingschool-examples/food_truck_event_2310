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

  def food_trucks_that_sell(item) # spent 1 hr on this because I wasn't using .find!
    trucks = []
    @food_trucks.find_all do |truck|
      trucks << truck if truck.inventory.keys.find {|key| key.name == item.name}
    end
    trucks
  end

  def all_items_all_trucks
    item_array = []
    @food_trucks.each do |truck|
      truck.inventory.keys.each do |key|
        item_array << key.name
      end
    end
    item_array.uniq.sort
  end
end
