# == Schema Information
#
# Table name: contacts
#
#  id                :bigint           not null, primary key
#  name              :string
#  company           :string
#  email             :string
#  phone             :string
#  method_of_contact :integer
#  work_description  :text
#  industry          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  contact_log       :text             default([]), is an Array
#  update_log        :text             default([]), is an Array
#
class Contact < ApplicationRecord
	validates :name, presence: true, length: { minimum: 4 }
	validates :company, presence: true, length: { minimum: 5 }
	validates :work_description, presence: true
	validates :industry, presence: true
	validates :email, presence: true
#	validate :method_verifier

#	def method_verifier
#		if (:method_of_contact == "email")
#			record.errors.add attribute, (options[:message] || "is not an email address") unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+[a-z]{2,})\z/i)
#		elsif (:method_of_contact == "phone")
#			errors.add(:base, 'Must be a phone number')
#			validate :phone, format: { with #regex for phone number 
#			}
#		else
#			
#		end
#	end

	def add_update_log
		self.update_log.push(Date.now)
	end

	def add_contact_log
		if (:contact_log)
			self.contact_log.push(:contact_log)
		end
	end

end
