class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :show_project_modal, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :show_project_modal]
	before_action :is_admin!, except: [:index, :show, :show_project_modal]

	def index
		@projects = Project.all
	end

	def show
	end

	def show_project_modal
		@projects = Project.all
		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@project = Project.new
	end

	def edit
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to @project
			flash[:success] = 'Project was successfully created.'
		else
			flash[:error] = @project.errors.full_messages
			render 'new'
		end
	end

	def update
		if @project.update(project_params)
			redirect_to @project
			flash[:success] = 'Project was successfully updated.'
		else
			flash[:error] = @project.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		@screenshots.destroy
		redirect_to projects_url
		flash[:notice] = 'Project was successfully destroyed.'
	end

	private
		def project_params
			params.require(:project).permit(:id, :name, :description, :tech_stack, :deployment,
				screenshot_attributes: [:id, :title, :image, :project_id])
		end

		def set_project
			@project = Project.find(params[:id])
			@screenshots = @project.screenshots
		end

end
