require './lib/item'
require './lib/item'
require './lib/food_truck' 
require 'pry'

RSpec.describe FoodTruck do
  describe '#initialize' do
    it 'has @name, @inventory, @stock' do
      @food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(@food_truck).to be_an_instance_of(FoodTruck)
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
      expect(@food_truck.inventory).to eq({})
    end
  end
end
