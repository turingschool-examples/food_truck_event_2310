class FoodTruck
  attr_reader :name,
              :inventory
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
    else #@inventory[item] != nil
      @inventory[item] += amount
    end
  end

  def potential_revenue
    item_totals = []
    @inventory.each do |key, value|
      item_totals << key.price * value
    end
    item_totals.sum
  end
end
