# frozen_string_literal: true

require 'byebug'

class CheckOut
  def initialize(rules)
    @rules = rules
    @item_counts = Hash.new(0)
  end

  def scan(item)
    item_counts[item] += 1
  end

  def total
    total_cost = 0

    items.each_with_object(item_counts.clone) do |item, quantities|
      rules.each do |rule|
        amended_count, cost = rule.consume!(item, quantities[item])
        quantities[item] = amended_count
        total_cost += cost
      end
    end

    total_cost
  end

  private

  attr_reader :rules, :item_counts

  def items
    item_counts.keys
  end
end
