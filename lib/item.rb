
class Item

  attr_accessor :name, :price

  def initialize(name_price)
    @name = name_price[:name]
    @price = name_price[:price].delete("$").to_f
  end


  
end