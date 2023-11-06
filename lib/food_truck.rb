

class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    if @inventory[item] == nil
     @inventory[item] = amount
    else
     @inventory[item] = @inventory[item] + amount
    end
  end


  def potential_revenue
    revenue_array = @inventory.keys.map do |item_object|
      item_object.price * @inventory[item_object]
    end
    revenue_array.sum
  end



end