class Bill < ApplicationRecord
  validates_presence_of :client_names, :emitting_date, :expiration_date
end
