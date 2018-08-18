class AddTypeToPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :payment_type, :integer, default: 0
  end
end
