class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.boolean :approved, default: false
      t.datetime :date
      t.float :amount, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
