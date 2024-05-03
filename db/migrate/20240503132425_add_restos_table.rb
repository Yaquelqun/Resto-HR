class AddRestosTable < ActiveRecord::Migration[7.1]
  def change
    create_table :restos do |r|
      r.datetime :date
      r.timestamps
    end
  end
end
