class CreatePlantEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :plant_events do |t|
      t.references :plant, null: false, foreign_key: true
      t.string :event_type
      t.string :title
      t.text :notes
      t.integer :xp_delta
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
