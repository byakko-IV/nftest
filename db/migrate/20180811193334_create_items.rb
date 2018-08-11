class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :description
      t.float :amount
      t.integer :quantity
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
