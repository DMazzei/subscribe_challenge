# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TaxCalculator do
  it 'calculates tax for a non-exempt, non-imported item' do
    item = Item.new(1, 'music CD', 14.99)
    expect(TaxCalculator.calculate(item)).to eq(1.50)
  end

  it 'calculates tax for a exempt, non-imported item' do
    item = Item.new(1, 'homemade food', 12.59)
    expect(TaxCalculator.calculate(item)).to eq(0)
  end

  it 'calculates tax for a non-exempt, imported item' do
    item = Item.new(1, 'imported 3D printer', 5.00)
    expect(TaxCalculator.calculate(item)).to eq(0.8)
  end

  it 'calculates tax for an exempt, imported item' do
    item = Item.new(1, 'imported box of chocolates', 10.00)
    expect(TaxCalculator.calculate(item)).to eq(0.50)
  end
end
