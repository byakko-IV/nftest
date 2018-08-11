class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.float :amount
      t.date :creation_date
      t.date :apply_date
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
