class CreateMeetingsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :meetings do |t|
      t.references :resto, null: false, foreign_key: true
      t.string :place
      t.datetime :date
      t.integer :duration
      t.timestamps
    end
  end
end
