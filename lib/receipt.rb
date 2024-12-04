# frozen_string_literal: true

require_relative 'item'
require_relative 'tax_calculator'

# Represents a receipt that contains multiple items
class Receipt
  attr_reader :calculated_items, :sales_tax_total, :total_cost

  def initialize
    @calculated_items = []
    @sales_tax_total = 0
    @total_cost = 0
  end

  def add_item(item)
    tax = TaxCalculator.calculate(item)
    total_including_tax = (item.price + tax) * item.quantity

    @sales_tax_total += tax * item.quantity
    @total_cost += total_including_tax

    calculated_items << { quantity: item.quantity, name: item.name, total_price: total_including_tax }
  end

  def generate_receipt
    receipt_lines = calculated_items.map do |item|
      format('%<quantity>d %<name>s: %<total_price>.2f', quantity: item[:quantity],
                                                         name: item[:name],
                                                         total_price: item[:total_price])
    end

    receipt_lines << format('Sales Taxes: %.2f', sales_tax_total)
    receipt_lines << format('Total: %.2f', total_cost)
    receipt_lines.join("\n")
  end
end
