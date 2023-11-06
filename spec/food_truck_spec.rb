require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

  end

  it 'has a name' do

    expect(@food_truck.name).to eq("Rocky Mountain Pies")  
  end

  it 'initializes with an empty inventory' do

    expect(@food_truck.inventory).to eq({})
  end

  it 'can check stock' do

    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can add items to inventory' do
    @food_truck.stock(@item1, 30)

    expect(@food_truck.inventory).to include(@item1)
    expect(@food_truck.check_stock(@item1)).to eq(30)
  end

  it 'can increase the stock of an item' do
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item1, 30)

    expect(@food_truck.check_stock(@item1)).to eq(55)
  end

  it 'can stock multiple items' do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item2, 12)

    expect(@food_truck.inventory).to include(@item1, @item2)
    expect(@food_truck.inventory[@item2]).to eq(12)
  end
end