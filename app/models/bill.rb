class Bill < ApplicationRecord
  has_many :items, inverse_of: :bill, dependent: :destroy
  has_one :payment, dependent: :destroy

  accepts_nested_attributes_for :items, reject_if: :all_blank,
                                        allow_destroy: true
  validates_presence_of :client_names, :emitting_date, :expiration_date

  def amount
    items.map(&:subtotal).reduce(0, :+)
  end
end
