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

    # trucks = []
    # @food_trucks.each do |truck|
    #   truck.inventory.keys.each do |key, amount|
    #     if item.name == key.name
    #       trucks << truck
    #     end
    #   end
    # end
    # trucks.uniq
  end

  def sorted_item_list
    sorted_list = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        sorted_list << item.name
      end
    end
    sorted_list.uniq.sort!

    # @food_trucks.flat_map do |truck|
    #   truck.inventory.map do |item, keys|
    #     item.name
    #   end
    # end.uniq.sort
  end

  def total_inventory
    total_items = Hash.new
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        if total_items[item] == nil
          total_items[item] = {
            quantity: amount,
            food_trucks: [food_truck]
          }
          # total_items[item] = {}
          # total_items[item].store(:quantity, amount)
          # total_items[item].store(:food_trucks, [])
          # total_items[item][:food_trucks] << food_truck
          # total_items[item][:food_trucks] = total_items[item][:food_trucks].uniq
        else
          total_items[item][:quantity] += amount
          total_items[item][:food_trucks] << food_truck
        end
      end
    end
    total_items

    # inventory = {}
    # @food_trucks.each do |truck|
    #   truck.inventory.each do |item, quantity|
    #     if inventory[item]
    #       inventory[item][:quantity] += quantity
    #       inventory[item][:food_trucks] << truck
    #     else
    #       inventory[item] = {
    #         quantity: quantity,
    #         food_trucks: [truck]
    #       }
    #     end
    #   end
    # end
  end

  def overstocked_items
    total_inventory.map do |item, subhash|
      if subhash[:quantity] > 50 && subhash[:food_trucks].count > 1
        item
      end
    end.compact
    require 'pry'; binding.pry
    # inventory = total_inventory
    # inventory.keys.select{|item| total_inventory[item][:quantity] > 50 && total_inventory[item][:food_trucks].count > 1}
  end

  def date
    date = Time.now
    if date.day
    "#{date.day}/#{date.month}/#{date.year}"
    end
  end
end
