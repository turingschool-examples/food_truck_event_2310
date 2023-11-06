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
    if inventory.key?(item)
      inventory[item] += item_quantity
    else 
      inventory[item] = item_quantity
    end
  end

  def check_stock(item)
    inventory[item] || 0
  end
end