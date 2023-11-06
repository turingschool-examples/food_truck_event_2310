require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  describe 'initialize' do
    it 'exists' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck). to be_a FoodTruck
    end

    it "has a name, inventory attribute" do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.name).to eq("Rocky Mountain Pies")
      expect(food_truck.inventory).to eq({})
    end
  end
end
