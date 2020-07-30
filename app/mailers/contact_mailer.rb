class ContactMailer < ApplicationMailer
	default to: Rails.application.credentials.gmail_username, 
			from: Rails.application.credentials.gmail_username

	def new_contact_email
		@contact = params[:contact]
		mail(subject: 'New Contact')
	end
end