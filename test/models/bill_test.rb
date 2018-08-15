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

  test 'bill amount should be 1800' do
    assert @bill.amount, 1800
    assert_not @bill.amount == 500
  end

  test 'penalty should be 100 time weeks amount of delay' do
    @bill.expiration_date = Date.today - 3.week
    assert @bill.penalty == 300
  end

  test 'total to pay should penalty if pay after expiration date' do
    @bill.payments = []
    @bill.expiration_date = Date.today - 1.week
    assert @bill.total_to_pay(Date.today) == 1900

    @bill.expiration_date = Date.today - 3.week
    assert @bill.total_to_pay(Date.today) == 2100

    @bill.expiration_date = Date.today
    assert @bill.total_to_pay == 1800
  end
end
