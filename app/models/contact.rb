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
	validates :name, presence: true, length: { in: 4..50 }
	validates :company, presence: true, length: { in: 5..50 }
	validates :work_description, presence: true
	validates :industry, presence: true
	validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

	def phone_validator
	end

# Methods for future contact management functions
	def add_update_log
		self.update_log.push(Date.now)
	end

	def add_contact_log
		if (:contact_log)
			self.contact_log.push(:contact_log)
		end
	end

end
