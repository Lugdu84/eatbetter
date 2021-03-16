class AddNametoFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :name
  end
end
