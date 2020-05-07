class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  end

  def show
  	@contact = Contact.find(params[:id])
  end

  def new
  	# List of Industries for select field in form.
  	@industries = [['', 0], ['Agriculture, Forestry and Wildlife', 1], ['Business & Information', 2], ['Construction & Utilities', 3], ['Education', 4], ['Finance & Insurance', 5], ['Food & Hospitality', 6], ['Health Services', 7], ['Legal Services, Safety & Security', 8], ['Motor Vehicles & Service', 9], ['Natural Resources & Environment', 10], ['Personal Services', 11], ['Real Estate & Housing', 12], ['Transportation & Logistics', 13]]
  	@contact = Contact.new
  end

  def edit
		@contact = Contact.find(params[:id])
	end

  def create
  	@contact = Contact.new(contact_params)
		
		if @contact.save
			redirect_to '/contact_confirmation'
		else
			render 'new'
		end
	end

	def update
		@contact = Contact.find(params[:id])

		if @contact.update(contact_params)
			redirect_to @contact
		else
			render 'edit'
		end
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to contacts_path
	end

	private
	def contact_params
		params.require(:contact).permit(:id, :name, :company, :email, :phone, :method_of_contact, :work_description, :industry)
	end
end
