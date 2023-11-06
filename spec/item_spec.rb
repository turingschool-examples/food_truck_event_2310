require "spec_helper"

RSpec.describe Item do
  it "exists" do
  item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
  expect(item1).to be_a Item
  end

  it "has a name" do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    expect(item1.name).to eq("Apple Pie (Slice)")
  end

  it "has a price" do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    expect(item1.price).to eq(2.50)
  end


end