class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone
      t.integer :method_of_contact
      t.text :work_description
      t.string :industry

      t.timestamps
    end
  end
end
