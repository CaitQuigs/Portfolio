class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :is_admin!, except: [:new, :create]

	def index
		@projects = Project.all
	end

	def show
	end

	def new
		@project = Project.new
#		@screenshots = @project.screenshots.build
	end

	def edit
	end

	def create
		@project = Project.new(project_params)
#		@project.build_screenshots

		if @project.save
			redirect_to @project, flash[:notice] = 'Project was successfully created.'
		else
			flash[:errors] = @project.errors.full_messages
			render 'new'
		end
	end

	def update
		if @project.update(project_params)
			redirect_to @project, flash[:notice] = 'Project was successfully updated.'
		else
			flash[:errors] = @project.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		@screenshots.destroy
		redirect_to projects_url, flash[:notice} = 'Project was successfully destroyed.'
	end

	private
		def project_params
			params.require(:project).permit(:id, :name, :description, :tech_stack, :deployment,
				screenshot_attributes: [:id, :title, :image])
		end

		def set_project
			@project = Project.find(params[:id])
			@screenshots = @project.screenshots
		end

end
