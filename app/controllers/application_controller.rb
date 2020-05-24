class ApplicationController < ActionController::Base
	helper_method :is_admin!

	add_flash_types :success, :error

	private
		def is_admin!
			unless current_user && current_user.admin
				redirect_to root_path
			end
		end
end
