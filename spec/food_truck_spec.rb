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
  
  it 'has 0 stock when called with check_stock' do
  expect(@food_truck.check_stock(@item1)).to eq(0)
  end
  
  it 'can stock an item' do
  @food_truck.stock(@item1, 30)

  expect(@food_truck.check_stock(@item1)).to eq(30)
  end
  
  it 'can stock more of an item and add to the total' do
  @food_truck.stock(@item1, 30)
  @food_truck.stock(@item1, 25)

  expect(@food_truck.check_stock(@item1)).to eq(55)
  end

  it 'can calculate the value of the trucks stock' do
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck1.stock(@item1, 35) 
    @food_truck1.stock(@item2, 7)
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @food_truck3.stock(@item1, 65)

    expect(@food_truck1.potential_revenue).to eq(148.75)
    expect(@food_truck2.potential_revenue).to eq(345.00)
    expect(@food_truck3.potential_revenue).to eq(243.75)
  end

end