class Project < ApplicationRecord
	validates :name, presence: true, length: { minimum: 6 }
	validates :description, presence: true, length: { minimum: 10 }
	validates :tech_stack, presence: true

# Need to correct this function to validate if :deployment is a URL. After correct, add to validations above.
	def valid_uri
		if deployment
		else
			errors.add(:deployment, "is not a valid URL.")
		end
	end
	
end
