# frozen_string_literal: true

require_relative 'item'

# Handles the calculation of sales taxes for items
class TaxCalculator
  BASIC_SALES_TAX = 0.10
  IMPORT_DUTY_TAX = 0.05
  ROUNDING_COEFICIENT = 0.05

  def self.calculate(item)
    tax_rate = 0
    tax_rate += BASIC_SALES_TAX unless item.exempt?
    tax_rate += IMPORT_DUTY_TAX if item.imported?

    raw_tax = item.price * tax_rate
    round_sales_tax(raw_tax)
  end

  def self.round_sales_tax(tax)
    (tax / ROUNDING_COEFICIENT).ceil * ROUNDING_COEFICIENT
  end
end
