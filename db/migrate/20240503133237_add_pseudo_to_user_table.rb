class AddPseudoToUserTable < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pseudo, :string, null: false
  end
end
