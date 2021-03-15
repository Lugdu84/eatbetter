class AddColumnToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :category, :string
  end
end
