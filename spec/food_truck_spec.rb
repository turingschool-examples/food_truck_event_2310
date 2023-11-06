require './lib/item'
require './lib/food_truck'


RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@food_truck).to be_a(FoodTruck)
    end
  end

  describe '#reads attributes' do
    it 'returns attributes' do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
      expect(@food_truck.inventory).to eq({})
    end
  end

  describe '#checks_stock' do
    it 'checks the stock of items' do
      expect(@food_truck.check_stock(@item1)).to eq(0)
    end
  end
end