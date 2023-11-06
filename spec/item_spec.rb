require "./lib/item"

describe Item do
    it "exists" do
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

        expect(item1).to be_a Item
    end

    it "stores and reads a name and price value" do
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

        expect(item1.name).to eq("Peach Pie (Slice)")
        expect(item1.price).to eq(3.75)
        expect(item2.name).to eq("Apple Pie (Slice)")
        expect(item2.price).to eq(2.50)
    end
end