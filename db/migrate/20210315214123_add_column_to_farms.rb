class AddColumnToFarms < ActiveRecord::Migration[6.0]
  def change
    add_reference :farms, :category, null: false, foreign_key: true
  end
end
