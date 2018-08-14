require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  setup do
    @payment = payments(:transferencia)
  end

  test 'valid payment' do
    assert @payment.valid?
  end

  test 'invalid payment without amount' do
    @payment.amount = nil
    assert_not @payment.valid?
  end

  test 'invalid payment without creation_date' do
    @payment.creation_date = nil
    assert_not @payment.valid?
  end

  test 'invalid payment without apply_date' do
    @payment.apply_date = nil
    assert_not @payment.valid?
  end
end
