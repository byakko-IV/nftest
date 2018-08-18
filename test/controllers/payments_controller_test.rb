require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill = bills(:one)
  end

  test 'should get new' do
    get new_bill_payment_url(@bill)
    assert_response :success
  end

  test 'should create payment with delay time' do
    payment = payments(:ventanilla)
    bill = bills(:two)
    assert_difference('Payment.count') do
      post bill_payments_url(bill), params: {
        payment:  { amount: payment.amount,
                    creation_date: payment.creation_date,
                    apply_date: payment.apply_date,
                    bill_id: payment.bill_id,
                    payment_type: payment.payment_type }
      }
      assert_not payment.bill.pagada?
      assert_redirected_to bill_url(payment.bill)
    end
  end

  test 'should create payment within time' do
    bill = bills(:one)
    payment = payments(:transferencia)
    assert_difference('Payment.count') do
      post bill_payments_url(bill), params: {
        payment:  { amount: payment.amount,
                    creation_date: payment.creation_date,
                    apply_date: payment.apply_date, bill_id: payment.bill_id,
                    payment_type: payment.payment_type }
      }
      assert payment.bill.pagada?
      assert_redirected_to bill_url(payment.bill)
    end
  end
end
