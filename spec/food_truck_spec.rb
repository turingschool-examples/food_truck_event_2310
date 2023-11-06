require './lib/item'
require './lib/item'
require './lib/food_truck' 
require 'pry'

RSpec.describe FoodTruck do
  describe '#initialize' do
    it 'has @name, @inventory' do
      @food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(@food_truck).to be_an_instance_of(FoodTruck)
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
      expect(@food_truck.inventory).to eq({})
    end
  end

  describe '#stock, #inventory' do
    it 'can tell what is in inventory' do
      @food_truck = FoodTruck.new("Rocky Mountain Pies")
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      
      expect(@food_truck.inventory).to eq({})
      expect(@food_truck.check_stock(@item1)).to eq(0)
    end

    it 'can stock inventory' do
      @food_truck = FoodTruck.new("Rocky Mountain Pies")
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      
      expect(@food_truck.check_stock(@item1)).to eq(0)
      expect(@food_truck.check_stock(@item2)).to eq(0)

      @food_truck.stock(@item1, 30)
      @food_truck.stock(@item2, 12)
      @food_truck.stock(@item1, 25)

      expect(@food_truck.check_stock(@item1)).to eq(55)
      expect(@food_truck.check_stock(@item2)).to eq(12)
    end
  end
end
