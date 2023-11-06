class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |food_truck| food_truck.inventory.include?(item)}
  end

  def sorted_item_list
    @food_trucks.map { |food_truck| food_truck.inventory.keys.map { |item| item.name} }.flatten.uniq.sort
  end

  def total_inventory
    #make new hash of quantities and food trucks
    total_inventory = Hash.new { |hash, key| hash[key] = {quantity: 0, food_trucks: []} }

    #iterate through food trucks
    @food_trucks.each do |food_truck|
      #iterate through food truck inventories
      food_truck.inventory.each do |item, quantity|
        #add item quantities to hash
        total_inventory[item][:quantity] += quantity
        #add trucks to hash for specified items
        total_inventory[item][:food_trucks] << food_truck 
      end
    end
    #return total_inventory hash
    total_inventory
  end

  def overstocked_items
    overstocked_items = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        if quantity > 50
          overstocked_items << item
        end
      end
    end
    overstocked_items
  end
end