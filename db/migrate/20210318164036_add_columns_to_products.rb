class AddColumnsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :content, :text
  end
end
