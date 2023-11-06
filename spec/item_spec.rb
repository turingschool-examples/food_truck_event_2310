require './lib/item'

RSpec.describe Item do
  describe '#initialize' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    it 'has a Hash parameter' do
      expect(Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})).to be_a Item
    end

    it 'has @name that is a String and @price that is an Integer' do
      expect(item1.name).to be_a String
      expect(item1.price).to be_a Integer
      expect(item1.name).to eq("Apple Pie (Slice)")
      expect(item1.price).to eq(2.50)
    end
  end
end
