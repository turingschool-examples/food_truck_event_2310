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
end