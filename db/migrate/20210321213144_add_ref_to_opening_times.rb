class AddRefToOpeningTimes < ActiveRecord::Migration[6.0]
  def change
    add_reference :opening_times, :adresse, null: false, foreign_key: true
  end
end
