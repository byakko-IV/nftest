require 'test_helper'

class Api::V1::PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill = bills(:one)
  end

  test 'should create payment with delay time' do
    payment = payments(:ventanilla)
    bill = bills(:two)
    post api_v1_bill_payments_url(bill), params: {
      payment:  { amount: payment.amount,
                  creation_date: payment.creation_date,
                  apply_date: payment.apply_date,
                  bill_id: payment.bill_id }
    }
    assert_response :success
  end
end
