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


  describe '#potential_revenue' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    it 'has no parameter and returns a Float that is the sum of their Items * quanitity' do
      expect(food_truck1.potential_revenue).to be_a Float
      expect(food_truck1.potential_revenue).to eq(148.75)
      expect(food_truck2.potential_revenue).to eq(345.00)
      expect(food_truck3.potential_revenue).to eq(243.75)
    end
  end
end
