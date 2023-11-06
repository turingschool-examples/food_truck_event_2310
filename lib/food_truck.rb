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
    elsif @inventory[item] != nil
      @inventory[item] += amount
    end
  end
end
