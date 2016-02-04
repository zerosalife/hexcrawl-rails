class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :code, limit: 4

      t.timestamps null: false
    end

    add_index :maps, :code, unique: true
  end
end
