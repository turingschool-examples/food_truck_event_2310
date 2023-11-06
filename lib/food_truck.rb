class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory[item] ||= 0
  end
  
  def stock(item, quantity)
    @inventory[item] ||= 0
    @inventory[item] += quantity
  end

  def potential_revenue
    revenue = 0
    @inventory.each do |item, quantity|
      revenue += item.price * quantity
    end
    revenue
  end

end