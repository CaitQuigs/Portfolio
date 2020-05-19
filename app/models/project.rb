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
	has_many :screenshots

	accepts_nested_attributes_for :project_tags, allow_destroy: true
	accepts_nested_attributes_for :screenshots, allow_destroy: true

	def tags_attributes=(tag_attributes)
		tag_attributes.values.each do |tag_attributes|
			tag = tag.find_or_create_by(tag_attribute)
			self.tags << tag
		end
	end

	
end
