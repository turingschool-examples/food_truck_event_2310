require './lib/item'
require './lib/food_truck'
require 'pry'


RSpec.describe FoodTruck do
  it 'exists' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_an_instance_of(FoodTruck)
  end

  it 'has attributes' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    expect(item2.name).to eq("Apple Pie (Slice)")
    expect(item2.price).to eq(2.50)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end
end
    