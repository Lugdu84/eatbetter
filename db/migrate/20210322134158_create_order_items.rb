class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :market, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.datetime :date_collect

      t.timestamps
    end
  end
end
