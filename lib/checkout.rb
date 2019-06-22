require 'byebug'

class CheckOut
  def initialize(rules)
    @rules = rules
    @item_counts = Hash.new(0)
  end

  def scan(item)
    @item_counts[item] += 1
  end

  def total
    total_cost = 0

    item_counts.each_with_object(item_counts) { |(item, count), quantities|
      rules.each do |rule|
        amended_count, cost = rule.consume!(item, count)
        quantities[item] = amended_count if amended_count != count
        total_cost += cost
      end
    }

    total_cost
  end

  private

  attr_reader :rules, :item_counts
end
