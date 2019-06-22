require 'minitest/autorun'
require './lib/rule'

class RuleTest < MiniTest::Unit::TestCase
  def test_consume!
    rule1 = Rule.new(item: 'A', price: 130, quantity: 3)
    assert_equal([1, 0], rule1.consume!('B', 1))
    assert_equal([1, 0], rule1.consume!('A', 1))
    assert_equal([0, 130], rule1.consume!('A', 3))
    assert_equal([0, 260], rule1.consume!('A', 6))
    assert_equal([1, 260], rule1.consume!('A', 7))

    rule1 = Rule.new(item: 'B', price: 50, quantity: 1)
    assert_equal([1, 0], rule1.consume!('A', 1))
    assert_equal([0, 50], rule1.consume!('B', 1))
    assert_equal([0, 100], rule1.consume!('B', 2))
  end
end
