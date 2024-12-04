# frozen_string_literal: true

# Represents an item in a shopping basket
class Item
  EXEMPT_ITEMS = %w[book chocolate chocolates pill pills food medical].freeze

  attr_reader :quantity, :name, :price

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price
  end

  def exempt?
    EXEMPT_ITEMS.any? { |item| name.include?(item) }
  end

  def imported?
    name.include?('imported')
  end
end
