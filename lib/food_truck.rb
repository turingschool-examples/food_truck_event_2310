require './lib/item'
require './lib/food_truck'

class FoodTruck
  attr_reader :name,
              :inventory
              
  def  initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

 def check_stock(food_item)
    @inventory[food_item] || 0
 end

 def stock(food_item, quantity)
    @inventory[food_item] += quantity
 end

 def potential_revenue
    revenue = 0

    @inventory.each do |item, quantity|
      revenue += item.price * quantity
    end
    revenue
  end
end