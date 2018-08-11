class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.string :client_names
      t.integer :status, default: 0
      t.date :emitting_date
      t.date :expiration_date

      t.timestamps
    end
  end
end
