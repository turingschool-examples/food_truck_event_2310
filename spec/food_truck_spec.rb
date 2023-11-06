require "./lib/item"
require "./lib/food_truck"

describe FoodTruck do
    it "exists" do
        food_truck = FoodTruck.new("Rocky Mountain Pies")

        expect(food_truck).to be_a FoodTruck
    end

    it "stores and reads a name, and creates default empty inventory hash" do
        food_truck = FoodTruck.new("Rocky Mountain Pies")

        expect(food_truck.name).to eq("Rocky Mountain Pies")
        expect(food_truck.inventory).to eq({})
    end

    it "checks inventory for current stock of given item" do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

        expect(food_truck.check_stock(item1)).to eq(0)
    end


    it "stocks an item with specified stock count" do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

        food_truck.stock(item1, 30)

        expect(food_truck.check_stock(item1)).to eq(30)
    end
end