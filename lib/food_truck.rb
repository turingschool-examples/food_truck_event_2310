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
      inventory[:item] += quantity
    else 
    inventory[:item] = quantity
    end
  end

  # def check_stock(item)
  #   inventory[:item] || 0
  # end
end