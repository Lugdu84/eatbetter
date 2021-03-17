class AddFakesColumnsToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :photo1, :string
    add_column :farms, :photo2, :string
    add_column :farms, :photo3, :string
    add_column :farms, :photo_owner, :string
  end
end
