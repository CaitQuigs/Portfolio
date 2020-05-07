class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
		@project_tags = @project.project_tags.build
		@tags = @project_tags.build_tag
		if @tags.empty?
			@tags = 'No tags yet'
		end
	end

	def edit
		@project = Project.find(params[:id])
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
		@project = Project.find(params[:id])

		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		@project = Project.find(params[:id])
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
				tag_attributes: [:id, :tag_name] ])
	end

end
