class AddCodeNameToRestos < ActiveRecord::Migration[7.1]
  def change
    add_column :restos, :code_name, :string, null: false
    add_index :restos, :code_name, unique: true
  end
end
