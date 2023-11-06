require 'date'

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
    @food_trucks.map{|food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select{|food_truck| food_truck.inventory.include?(item)}
  end

  def sorted_item_list
    sorted_list = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        sorted_list << item.name
      end
    end
    sorted_list.uniq.sort!
  end

  def total_inventory
    total_items = Hash.new
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        if total_items[item] == nil
          total_items[item] = {}
          total_items[item].store(:quantity, amount)
          total_items[item].store(:food_trucks, [])
          total_items[item][:food_trucks] << food_truck
          total_items[item][:food_trucks] = total_items[item][:food_trucks].uniq
        else
          total_items[item][:quantity] = total_items[item][:quantity] + amount
          total_items[item][:food_trucks] << food_truck
        end
      end
    end
    total_items
  end
end
