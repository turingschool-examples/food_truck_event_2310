require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  describe 'initialize' do
    it 'exists' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event).to be_a Event
    end

    it 'has some attributes: name, food_trucks' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event.name).to eq("South Pearl Street Farmers Market")
      expect(event.food_trucks).to eq([])
    end
  end
end
