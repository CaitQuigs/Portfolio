class ChangeColumnNameTag < ActiveRecord::Migration[6.0]
  def change
  	rename_column :tags, :tag, :tag_name
  end
end
