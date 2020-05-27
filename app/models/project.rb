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

	def screenshot_urls
		screenshot_urls = []
		self.screenshots.each do |screenshot|
			ss_url = Rails.application.routes.url_helpers.rails_blob_path(screenshot.image, only_path: true)
			screenshot_urls.push(ss_url)
		end
		return screenshot_urls
	end

	def thumbnail
		@screenshot = self.screenshots.first
		return @screenshot.image
	end



	
end
