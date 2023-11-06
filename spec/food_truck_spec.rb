require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do

  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new('Rocky Mountain Pies')
  end

  it 'exists: Item' do
  expect(@item2).to be_an_instance_of(Item)
  end
  
  it 'has Item name' do
    expect(@item2.name).to eq('Apple Pie (Slice)')
  end
  
  it 'has Item price' do
    expect(@item2.price).to eq(2.50)
  end

  it 'exists: FoodTruck' do
  expect(@food_truck).to be_an_instance_of(FoodTruck)
  end
  
  it 'has FoodTruck name' do
  expect(@food_truck.name).to eq('Rocky Mountain Pies')
  end

  it 'has empty inventory hash' do
  expect(@food_truck.inventory).to eq({})
  end

end