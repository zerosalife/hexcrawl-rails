class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.boolean :revealed
      t.json :data
      t.string :tile_icon
      t.text :notes
      t.references :map, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
