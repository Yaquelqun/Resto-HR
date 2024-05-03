class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.references :participation, index: :true, null: false
      t.string :state

      t.timestamps
    end
  end
end
