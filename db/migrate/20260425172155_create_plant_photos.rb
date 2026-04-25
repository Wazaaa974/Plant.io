class CreatePlantPhotos < ActiveRecord::Migration[8.1]
  def change
    create_table :plant_photos do |t|
      t.references :plant, null: false, foreign_key: true
      t.datetime :taken_at
      t.text :notes
      t.string :ai_analysis_status
      t.string :ai_species_guess
      t.text :ai_health_summary

      t.timestamps
    end
  end
end
