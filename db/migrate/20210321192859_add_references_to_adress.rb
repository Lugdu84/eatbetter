class AddReferencesToAdress < ActiveRecord::Migration[6.0]
  def change
    add_reference :adresses, :farm, null: false, foreign_key: true
  end
end
