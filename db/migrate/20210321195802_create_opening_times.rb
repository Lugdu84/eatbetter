class CreateOpeningTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :opening_times do |t|
      t.string :start
      t.string :end
      t.string :day
      t.string :content

      t.timestamps
    end
  end
end
