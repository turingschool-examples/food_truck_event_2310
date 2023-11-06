class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck if !@food_trucks.include?(food_truck)
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory[item] != nil
    end
  end

  def sorted_item_list
    item_list = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |inventory_item, inventory_quantity|
        item_list << inventory_item.name
      end
    end
    item_list.uniq.sort
  end

end