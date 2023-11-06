require './lib/item'
require './lib/food_truck'

class FoodTruck
  attr_reader :name,
              :inventory
              # :check_stock
  def  initialize(name)
    @name = name
    @inventory = Hash.new(0)
    # require 'pry'; binding.pry
  end

 def check_stock(food_item)
  @inventory[food_item] || 0
  # require 'pry'; binding.pry
 end

 def stock(food_item, quantity)
  @inventory[food_item] += quantity

 end
end