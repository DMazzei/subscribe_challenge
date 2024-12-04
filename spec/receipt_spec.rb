# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Receipt do
  it 'calculates the total sales taxes and cost for a receipt' do
    receipt = Receipt.new

    receipt.add_item(Item.new(2, 'book', 12.49))
    receipt.add_item(Item.new(1, 'music CD', 14.99))
    receipt.add_item(Item.new(1, 'chocolate bar', 0.85))

    expect(receipt.sales_tax_total).to eq(1.50)
    expect(receipt.total_cost).to eq(42.32)
    expect(receipt.generate_receipt).to eq(
      <<~RECEIPT.chomp
        2 book: 24.98
        1 music CD: 16.49
        1 chocolate bar: 0.85
        Sales Taxes: 1.50
        Total: 42.32
      RECEIPT
    )
  end
end
