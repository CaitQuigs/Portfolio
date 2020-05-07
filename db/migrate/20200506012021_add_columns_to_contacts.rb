class AddColumnsToContacts < ActiveRecord::Migration[6.0]
  def change
  	add_column :contacts, :contact_log, :text, array: true, default: []
  	add_column :contacts, :update_log, :text, array: true, default: []
  end
end
