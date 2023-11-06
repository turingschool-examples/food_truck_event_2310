require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market") 
  end

  describe '#initialize' do
    it 'exists' do
      expect(@event).to be_a(Event)
    end
  end

  describe '#attributes' do
    it 'reads attrritbutes and returns them' do
      expect(@event.name).to eq("South Pearl Street Farmers Market")
      expect(@event.food_trucks).to eq([])
    end
  end
end