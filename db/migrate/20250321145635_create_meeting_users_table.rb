class CreateMeetingUsersTable < ActiveRecord::Migration[8.0]
  def change
    create_table :meeting_users_tables do |t|
      t.references :meeting, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
