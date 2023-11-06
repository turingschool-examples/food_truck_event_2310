require './lib/item.rb'
require 'pry'

RSpec.describe Item do
  it 'has a name' do
    item = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    expect(item.name).to eq('Apple Pie (Slice)')
  end

  it 'has a price' do
    item = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    
    expect(item.price).to eq(2.50)
  end
end