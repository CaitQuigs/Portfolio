class ContactMailer < ApplicationMailer
	default to: 'quigleywebdev@gmail.com', 
			from: 'quigleywebdev@gmail.com'

	def new_contact_email
		@contact = params[:contact]
		mail(subject: 'New Contact')
	end
end