class DropFeedbackTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :feedbacks
  end

  def down
    create_table :feedbacks do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end 