class Item < ApplicationRecord
  belongs_to :bill

  validates_presence_of :description, :amount
  validates :quantity, numericality: { greater_than: 0 }
end
