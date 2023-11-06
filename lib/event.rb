class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck if !@food_trucks.include?(truck)
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory.include?(item)
    end
  end

  def sorted_item_list
    items = @food_trucks.flat_map do |truck|
      truck.inventory.map do |item, quantity|
        item.name
      end
    end
    items.uniq.sort
  end

  def total_inventory
    inventory = {}

    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if inventory[item]
          inventory[item][:quantity] += quantity
          inventory[item][:food_trucks] << truck
        else
          inventory[item] = {
            quantity: quantity,
            food_trucks: [truck]
          }
        end
      end
    end
    inventory
  end

  #   items = []
  #   @food_trucks.each do |truck|
  #     truck.inventory.each do |item, quantity|
  #       items << item
  #     end
  #   items.uniq
  #   end

  #   total_inventory = {}
  #   items.each do |item|
  #     total_inventory[item] = {}
  #     total_inventory[item][:quantity] = 0
  #     total_inventory[item][:food_trucks] = []
  #   end

  #   @food_trucks.each do |truck|
  #     truck.inventory.each do |item, quantity|
  #       if total_inventory[item][:quantity] != 0
  #         total_inventory[item][:quantity] += quantity
  #       else
  #         total_inventory[item][:quantity] = quantity
  #       end
  #     end
  #   end

  #   items.each do |item|
  #     total_inventory[item][:food_trucks] = food_trucks_that_sell(item)
  #   end
  # total_inventory
  # end

  def overstocked_items
    total_inventory.keys.find_all do |item|
      total_inventory[item][:quantity] > 50 &&
      total_inventory[item][:food_trucks].count > 1
    end.flatten
  end

end