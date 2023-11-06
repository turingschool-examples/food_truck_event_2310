class Item
  attr_reader :name,
              :price

  def initialize(hash)
    @name = hash[:name]
    @price = hash[:price].delete("$").to_f.round(2)
  end
end
