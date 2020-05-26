class ScreenshotsController < ApplicationController
  before_action :set_project
  before_action :set_screenshot, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_admin!  

  def index
  	@screenshots = @project.screenshots.all
  end

  def show
  end

  def new
  	@screenshot = @project.screenshots.build
  end

  def edit
  end

  def create
  	@screenshot = @project.screenshots.build(screenshot_params)
	  	if @screenshot.save
  		  redirect_to project_screenshots_path(@project)
        flash[:success] = "Screenshot was successfully created."
  		else
        flash[:error] = @screenshot.errors.full_messages
  			render 'new'
  		end
  end

  def update
	  if @screenshot.update(screenshot_params)
  		redirect_to project_screenshot_path(@project)
      flash[:success] = "Screenshot was successfully updated."
  	else
      flash[:error] = @screenshot.errors.full_messages
  		render 'edit'
  	end
  end

  def destroy
    @screenshot.image.purge
  	@screenshot.destroy
  	redirect_to project_screenshots_path(@project)
    flash[:notice] = "Screenshot was successfully destroyed."
  end

  private
  	def screenshot_params
  		params.require(:screenshot).permit(:id, :title, :project_id, :image)
  	end

  	def set_screenshot
  		@screenshot = @project.screenshots.find(params[:id])
  	end

  	def set_project
  		@project = Project.find(params[:project_id])
  	end

end
