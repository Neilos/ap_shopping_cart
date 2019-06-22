# frozen_string_literal: true

class Rule
  def initialize(item:, price:, quantity: 1)
    @item = item
    @price = price
    @quantity = quantity
  end

  def consume!(scanned_item, scanned_quantity)
    return [scanned_quantity, 0] unless item == scanned_item
    return [scanned_quantity, 0] unless scanned_quantity >= quantity

    number_of_rule_applications = scanned_quantity / quantity
    [scanned_quantity % quantity, number_of_rule_applications * price]
  end

  private

  attr_reader :item, :price, :quantity
end
