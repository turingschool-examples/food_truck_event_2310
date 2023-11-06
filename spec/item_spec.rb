require './lib/item.rb'
require 'pry'

RSpec.describe Item do
  before :each do
    @item = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'has a name' do

    expect(@item.name).to eq('Apple Pie (Slice)')
  end

  it 'has a price' do   

    expect(@item.price).to eq(2.50)
  end
end