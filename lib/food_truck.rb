require './lib/item'
require './lib/food_truck'

class FoodTruck
  attr_reader :name,
              :inventory
              # :check_stock
  def  initialize(name)
    @name = name
    @inventory = {}
    # @check_stock = 0
  end

 def check_stock(food_item)
  @inventory[food_item] || 0
 end

 def stock(food_item, quantity)
  @inventory[food_item] = quantity

 end
end