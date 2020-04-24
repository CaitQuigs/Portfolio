class Project < ApplicationRecord
	validates :name, presence: true, length: { minimum: 6 }
	validates :description, presence: true, length: { minimum: 10 }
	validates :tech_stack, presence: true
	validates :deployment, allow_blank: true, :valid_uri

	def valid_uri
		if deployment
		else
			errors.add(:deployment, "is not a valid URL.")


	end
	
end
