class Tag < ApplicationRecord
	validates :tag_name, uniqueness: true

	has_many :project_tags
	has_many :projects, through: :project_tags

	accepts_nested_attributes_for :project_tags, allow_destroy: true
end
