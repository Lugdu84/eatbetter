class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.string :address
      t.string :tel
      t.string :email
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
