require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  describe '#initialize' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    it 'has one String parameter' do
      expect(FoodTruck.new("Rocky Mountain Pies")).to be_a FoodTruck
    end

    it 'has a String @name, and an empty Hash @inventory' do
      expect(food_truck.name).to be_a String
      expect(food_truck.inventory).to be_a Hash
      expect(food_truck.name).to eq("Rocky Mountain Pies")
      expect(food_truck.inventory).to eq ({})
    end
  end

  describe '#check_stock' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    it 'has one Item parameter and returns the stock amount of @inventory in Integer with a default value of 0' do
      expect(food_truck.check_stock(item1)).to be_a Integer
      expect(food_truck.check_stock(item1)).to eq 0
      food_truck.stock(item1, 30)
      expect(food_truck.check_stock(item1)).to eq 30
    end
  end

  describe '#stock' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    it 'has an Item parameter, and an Integer parameter that adds to the @inventory Hash' do
      expect(food_truck.stock(item1, 30)).to be_a Integer
      expect(food_truck.stock(item1, 30)).to eq 30
      expect(food_truck.inventory).to eq({item1 => 30})
    end
  end
end
