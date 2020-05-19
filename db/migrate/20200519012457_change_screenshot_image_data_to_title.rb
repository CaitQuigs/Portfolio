class ChangeScreenshotImageDataToTitle < ActiveRecord::Migration[6.0]
  def change
  	rename_column :screenshots, :image_data, :title
  	change_column :screenshots, :title, :string
  end
end
