class Project < ApplicationRecord
	validates :name, presence: true, length: { minimum: 6 }
	validates :description, presence: true, length: { minimum: 10 }
	validates :tech_stack, presence: true
	validate :valid_uri

	has_many :project_tags
	has_many :tags, through: :project_tags

	accepts_nested_attributes_for :project_tags, allow_destroy: true

	def tags_attributes=(tag_attributes)
		tag_attributes.values.each do |tag_attributes|
			tag = tag.find_or_create_by(tag_attribute)
			self.tags << tag
		end
	end




# Need to correct this function to validate if :deployment is a URL. After correct, add to validations above.
	def valid_uri
		unless self.deployment.include? "http://" || (self.deployment == "")
			errors.add(:deployment, "is not a valid URL.")
		end
	end
	
end
