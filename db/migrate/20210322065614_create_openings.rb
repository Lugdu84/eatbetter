class CreateOpenings < ActiveRecord::Migration[6.0]
  def change
    create_table :openings do |t|
      t.string :day
      t.string :start
      t.string :end
      t.references :market, null: false, foreign_key: true

      t.timestamps
    end
  end
end
