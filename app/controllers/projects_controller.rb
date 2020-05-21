class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

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
#		@tags = Tag.all
	end

	def create
		@project = Project.new(project_params)

#		@project.build_screenshots
#		new_screenshots_attributes = params[:files].inject({}) do |hash, file|
#			hash.merge!(SecureRandom.hex => { image: file })
#		end
		if @project.save
			redirect_to @project, notice: 'Project was successfully created.'
		else
			render 'new'
		end
	end

	def update
		respond_to do |format|
			if @project.update(project_params)
				format.html { redirect_to @project, notice: 'Project was successfully updated.' }
				format.json { render :show, status: :ok, location: @project }
			else
				format.html { render :edit }
				format.json { render json: @project.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@project.destroy
		respond_to do |format|
			format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
			format.json { head :no_content } 
		end
	end

	def delete_pt
		@project_tag = ProjectTag.find(params[:id])
		@project_tag.destroy
		redirect_to project_path
	end

	private
		def project_params
			params.require(:project).permit(:id, :name, :description, :tech_stack, :deployment,
				screenshot_attributes: [:id, :title, :image])
		end

		def set_project
			@project = Project.find(params[:id])
#			@screenshots = @project.screenshots
		end

end
