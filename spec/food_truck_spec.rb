require "spec_helper"

RSpec.describe Item do
  it "exists" do
  food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck).to be_a FoodTruck
  end

  it "has a name" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has an inventory" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end

  it "has a check_stock method" do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    food_truck.stock(item1, 30)
    expect(food_truck.check_stock(item1)).to eq(30)

  end
end