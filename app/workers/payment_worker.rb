class PaymentWorker
  include Sidekiq::Worker

  def perform(*args)
    bill = Bill.find(args[0].to_i)
    payment = Payment.new
    payment.creation_date = args[1]
    payment.apply_date = args[2]
    payment.amount = args[3].to_f
    payment.bill_id = args[0].to_i
    bill.pay! if payment.amount >= bill.total_to_pay(
      payment.creation_date
    )
    payment.save
  end
end
