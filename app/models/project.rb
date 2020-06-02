# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  name        :string
#  tech_stack  :string
#  description :text
#  deployment  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Project < ApplicationRecord
	validates :name, presence: true, length: { minimum: 6 }
	validates :description, presence: true, length: { minimum: 10 }
	validates :tech_stack, presence: true
	validates :deployment, format: URI::regexp(%w(http https)), allow_blank: true
	validates_associated :screenshots

	has_many :project_tags
	has_many :tags, through: :project_tags
	has_many :screenshots, dependent: :destroy

	accepts_nested_attributes_for :screenshots, allow_destroy: true

	def carousel_urls
		carousel_urls = []
		self.screenshots.each do |screenshot|
			sized_image = screenshot.image.variant(resize_to_fit: [800, 450])
			carousel_url = Rails.application.routes.url_helpers.rails_representation_path(sized_image, only_path: true)
			carousel_urls.push(carousel_url)
		end
		return carousel_urls
	end

	def thumbnail
		@screenshot = self.screenshots.first
		thumbnail = @screenshot.image.variant(resize_to_fit: [400, 225])
		return thumbnail
	end

end
