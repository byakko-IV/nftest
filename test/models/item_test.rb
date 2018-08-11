require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  setup do
    @item = items(:service)
  end

  test 'valid item' do
    assert @item.valid?
  end

  test 'invalid item without description' do
    @item.description = nil
    assert_not @item.valid?
  end

  test 'invalid item without amount' do
    @item.amount = nil
    assert_not @item.valid?
  end

  test 'invalid item if quantity is cero' do
    @item.quantity = 0
    assert_not @item.valid?
  end

  test 'item subtotal should be 1800' do
    assert @item.subtotal, 1800
  end
end
