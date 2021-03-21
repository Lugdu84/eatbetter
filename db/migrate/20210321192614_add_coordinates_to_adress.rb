class AddCoordinatesToAdress < ActiveRecord::Migration[6.0]
  def change
    add_column :adresses, :latitude, :float
    add_column :adresses, :longitude, :float
  end
end
