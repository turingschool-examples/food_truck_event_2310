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

  def total_inventory
    inventory_items = [] # array of item instances
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |inventory_item, inventory_quantity|
        inventory_items << inventory_item if !inventory_items.include?(inventory_item)
      end
    inventory_items
    end

    total_inventory = {}
    inventory_items.each do |inventory_item|
      total_inventory[inventory_item] = {}
      total_inventory[inventory_item][:quantity] = 0
      total_inventory[inventory_item][:food_trucks] = []
    end

    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |inventory_item, inventory_quantity|
        if total_inventory[inventory_item][:quantity] != 0
          total_inventory[inventory_item][:quantity] += inventory_quantity
        else
          total_inventory[inventory_item][:quantity] = inventory_quantity
        end
      end
    end

    inventory_items.each do |inventory_item|
      total_inventory[inventory_item][:food_trucks] = food_trucks_that_sell(inventory_item)
    end
  total_inventory
  end

  def overstocked_items
    total_inventory.find_all do |inventory_item, hash|
      total_inventory[inventory_item][:quantity] > 50 &&
      total_inventory[inventory_item][:food_trucks].count > 1
    end
  end

end