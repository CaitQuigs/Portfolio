class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]
	def index
		@projects = Project.all
	end

	def show
	end

	def new
		@project = Project.new
		@project_tags = @project.project_tags.build
		@tags = Tag.all
	end

	def edit
		@tags = Tag.all
	end

	def create
		@project = Project.new(project_params)
		
		if @project.save
			redirect_to '/projects'
		else
			render 'new'
		end
	end

	def update
		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		@project_tags = @project.project_tags.build
		@project.destroy
		@project_tags.destroy
		redirect_to projects_path
	end

	def delete_pt
		@project_tag = ProjectTag.find(params[:id])
		@project_tag.destroy
		redirect_to project_path
	end

	private
		def project_params
			params.require(:project).permit(:name, :description, :tech_stack, :deployment,
				project_tag_attributes: [ :id, :tag_id, :project_id, 
					tag_attributes: [:id, :tag_name] ],
				screenshot_attributes: [:id, :image_data])
		end

		def set_project
			@project = Project.find(params[:id])
		end

end
