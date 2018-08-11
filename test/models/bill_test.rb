require 'test_helper'

class BillTest < ActiveSupport::TestCase
  setup do
    @bill = bills(:one)
  end

  test 'valid bill' do
    assert @bill.valid?
  end

  test 'invalid without client_names' do
    @bill.client_names = nil
    assert_not @bill.valid?
  end

  test 'invalid without emitting_date' do
    @bill.emitting_date = nil
    assert_not @bill.valid?
  end

  test 'invalid without expiration_date' do
    @bill.expiration_date = nil
    assert_not @bill.valid?
  end
end
