class Item
  attr_reader :name,
              :price
  def initialize(data_hash)
    @name = data_hash[:name]
    @price = data_hash[:price].delete('$').to_f
  end
end
