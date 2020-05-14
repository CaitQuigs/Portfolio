class CreateScreenshots < ActiveRecord::Migration[6.0]
  def change
    create_table :screenshots do |t|
      t.text :image_data
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
