class ContactsController < ApplicationController
	before_action :set_industries
	before_action :authenticate_user!, except: [:new, :create]
	before_action :is_admin!, except: [:new, :create]

  def index
  	@contacts = Contact.all
  end

  def show
  	@contact = Contact.find(params[:id])
  end

  def new
  	@contact = Contact.new
  end

  def edit
		@contact = Contact.find(params[:id])
	end

  def create
  	@contact = Contact.new(contact_params)
		
		if @contact.save
			redirect_to '/contact_confirmation'
			flash[:success] = "Contact Information submitted successfully."
		else
			flash[:error] = @contact.errors.full_messages
			render 'new'
		end
	end

	def update
		@contact = Contact.find(params[:id])

		if @contact.update(contact_params)
			redirect_to @contact
			flash[:success] = "Contact was successfully updated."
		else
			render 'edit'
		end
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to contacts_path
		flash[:notice] = "Contact was successfully destroyed."
	end

	private
	def contact_params
		params.require(:contact).permit(:id, :name, :company, :email, :phone, :method_of_contact, :work_description, :industry)
	end

	def set_industries
  	# List of Industries for select field in form.
		@industries = [['Agriculture, Forestry and Wildlife', 1], ['Arts, Entertainment & Recreation', 2], ['Business Administration & Support', 3], ['Construction & Utilities', 4], ['Education', 5], ['Finance & Insurance', 6], ['Food & Hospitality', 7], ['Health Services', 8], ['Legal Services, Safety & Security', 9], ['Life & Natural Sciences', 10], ['Manufacturing', 11], ['Motor Vehicles & Service', 12], ['Natural Resources & Environment', 13], ['Personal Services', 14], ['Real Estate & Housing', 15], ['Technology & Electronics', 16], ['Telecommunications & Information', 17], ['Transportation & Logistics', 18], ['Other', 19]]
	end

end
