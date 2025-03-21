class AddStateToResto < ActiveRecord::Migration[8.0]
  def change
    add_column :restos, :state, :string, default: 'waiting_for_participants'
  end
end
