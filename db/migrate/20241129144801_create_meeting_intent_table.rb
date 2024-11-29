class CreateMeetingIntentTable < ActiveRecord::Migration[7.1]
  def change
    create_table :meeting_intents do |t|
      t.references :resto, index: :true, null: false
      t.references :target, index: :true, null: false, foreign_key: { to_table: :users }
      t.references :initiator, index: :true, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
