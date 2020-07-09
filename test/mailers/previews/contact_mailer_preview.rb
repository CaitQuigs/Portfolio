# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
	def new_contact_email
		ContactMailer.with(contact: Contact.first).new_contact_email
	end

end
