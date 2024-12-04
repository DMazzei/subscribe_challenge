# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Item do
  it 'identifies imported items correctly' do
    item = Item.new(1, 'imported bottle of perfume', 47.50)
    expect(item.imported?).to be true
  end

  it 'identifies items not imported correctly' do
    item = Item.new(1, 'local produce', 47.50)
    expect(item.imported?).to be false
  end

  it 'identifies exempt items correctly' do
    item = Item.new(1, 'book', 12.49)
    expect(item.exempt?).to be true
  end

  it 'identifies non-exempt items correctly' do
    item = Item.new(1, 'music CD', 14.99)
    expect(item.exempt?).to be false
  end
end
