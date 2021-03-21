class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :name
      t.string :adress

      t.timestamps
    end
  end
end
