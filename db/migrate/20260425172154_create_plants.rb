class CreatePlants < ActiveRecord::Migration[8.1]
  def change
    create_table :plants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nickname, null: false
      t.string :species_name, null: false
      t.string :common_name
      t.text :description
      t.integer :level, null: false, default: 1
      t.integer :xp, null: false, default: 0
      t.string :growth_stage, null: false, default: "seedling"
      t.date :acquired_at
      t.string :location_name
      t.timestamps
    end

    add_index :plants, :growth_stage
  end
end
