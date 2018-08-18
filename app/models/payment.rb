class Payment < ApplicationRecord
  belongs_to :bill

  validates_presence_of :amount, :creation_date, :apply_date

  enum payment_type: [:ventanilla, :transferencia]
end
