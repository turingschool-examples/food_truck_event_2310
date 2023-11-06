class FoodTruck
  attr_reader :name, 
              :inventory, 
              :stock

  def initialize(name)
    @name = name
    @inventory = {}
    @stock = 0
  end

  def stock(item, item_quantity)
    require 'pry' ; binding.pry
    @inventory << inventory[item] += quantity
  end

  def check_stock(item)
    inventory[:item]
  end


end