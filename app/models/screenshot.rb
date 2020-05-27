# == Schema Information
#
# Table name: screenshots
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_screenshots_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Screenshot < ApplicationRecord
  belongs_to :project
  validates :title, presence: true, length: { minimum: 7 }
  
  has_one_attached :image

  # Image formatting methods
  def optimized_image(image, x, y)
  	return image.variant(resize_to_fill: [x, y]).processed
  end

  def thumbnail(image)
  	return image.variant(resize_to_fill: [400, 225]).processed
  end
end
