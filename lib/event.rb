

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
    @food_trucks.map do |truck|
     truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory[item] > 0
    end
  end

  def sorted_item_list
    sorted_list = []
    @food_trucks.find_all do |food_truck|
     food_truck.inventory.find_all do|item, stock|
      stock > 0
      sorted_list << item.name
     end
    end
    sorted_list.uniq.sort
  end

  def sorted_item_list_objects
    sorted_list = []
    @food_trucks.find_all do |food_truck|
     food_truck.inventory.find_all do|item, stock|
      stock > 0
      sorted_list << item
     end
    end
    sorted_list.uniq
  end

  def total_inventory
    hash1 = Hash.new(0)
    list_of_items = sorted_item_list_objects
    list_of_items.each do |item|
      hash1[item] = {quantity: 0, food_trucks: []}
      @food_trucks.each do |truck|
        number_in_stock = truck.check_stock(item)
        hash1[item][:quantity] += number_in_stock
        if truck.inventory.include?(item)
          hash1[item][:food_trucks] << truck.name
        end
      end
    end
    hash1
  end



end