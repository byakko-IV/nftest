class Api::V1::PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    PaymentWorker.perform_async(params[:bill_id],
                                params[:payment][:creation_date],
                                params[:payment][:apply_date],
                                params[:payment][:amount],
                                params[:payment][:payment_type])
    render json: { status: :success }
  end
end
