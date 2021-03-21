class AddColumnsToAdress < ActiveRecord::Migration[6.0]
  def change
    add_column :adresses, :day, :string
    add_column :adresses, :start, :string
    add_column :adresses, :end, :string
  end
end
