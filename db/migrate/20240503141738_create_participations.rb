class CreateParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :participations do |t|
      t.references :user, index: :true, null: false
      t.references :resto, index: :true, null: false
      t.timestamps
    end
  end
end
