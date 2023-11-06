require './lib/item'
require './lib/food_truck' 
require './lib/event'
require 'pry'

RSpec.describe Event do
  describe 'initialize' do
    it 'has @name, @food_trucks' do
      @event = Event.new("South Pearl Street Farmers Market")

      expect(@event).to be_an_instance_of(Event)
      expect(@event.name).to eq("South Pearl Street Farmers Market")
      expect(@event.food_trucks).to eq([])
    end
  end
end
