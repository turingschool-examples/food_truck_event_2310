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
    @inventory[item] = amount
  end

  def potential_revenue
    @inventory.map {|item, quantity| item.price * quantity}.sum
  end
end
