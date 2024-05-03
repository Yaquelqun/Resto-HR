class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.references :participation, index: :true, null: false
      t.references :target, index: :true, null: false, foreign_key: { to_table: :users }
      t.string :state

      t.timestamps
    end
  end
end
