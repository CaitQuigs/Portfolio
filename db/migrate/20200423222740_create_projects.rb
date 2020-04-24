class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :tech_stack
      t.text :description
      t.string :deployment

      t.timestamps
    end
  end
end
