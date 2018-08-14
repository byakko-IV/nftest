class Bill < ApplicationRecord
  has_many :items, inverse_of: :bill, dependent: :destroy
  has_many :payments, dependent: :destroy

  accepts_nested_attributes_for :items, reject_if: :all_blank,
                                        allow_destroy: true

  validates_presence_of :client_names, :emitting_date, :expiration_date

  enum status: [:pendiente, :pagada]

  def amount
    items.map(&:subtotal).reduce(0, :+)
  end

  def payment_delay
    (Date.current - expiration_date).to_i / 7
  end

  def penalty
    payment_delay * 100
  end

  def total_to_pay(payment_apply = Date.today)
    payment_apply > expiration_date ? amount + penalty : amount
  end

  def pay!
    update(status: 'pagada')
  end
end
