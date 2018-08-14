class PaymentsController < ApplicationController
  before_action :set_bill

  def new
    @payment = @bill.payments.new
  end

  def create
    @payment = Payment.new(payments_params)
    if @payment.save
      @bill.pay! if @payment.amount >= @bill.total_to_pay(
        @payment.creation_date
      )
      redirect_to @payment.bill
    else
      render :new
    end
  end

  private

  def payments_params
    params.require(:payment).permit(:amount, :creation_date, :apply_date,
                                    :bill_id)
  end

  def set_bill
    @bill = Bill.find(params[:bill_id])
  end
end
