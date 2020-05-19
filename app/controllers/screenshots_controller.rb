class ScreenshotsController < ApplicationController
  before_action :set_project
  before_action :set_screenshot, only: [:show, :edit, :update, :destroy]
  

  def index
  	@screenshots = @project.screenshots.all
  end

  def show
  end

  def new
  	@screenshot = Screenshot.new
  end

  def edit
  end

  def create
  	@screenshot = @project.screenshots.new(screenshot_params)
	  	if @screenshot.save
  		  redirect_to project_screenshot_path(@screenshot), notice: "Screenshot was successfully created."
  		else
  			render 'new'
  		end
  end

  def update
	  if @screenshot.update(screenshot_params)
  		redirect_to project_screenshot_path(@screenshot), notice: "Screenshot was successfully updated."
  	else
  		render 'edit'
  	end
  end

  def destroy
    @screenshot.image.purge
  	@screenshot.destroy
  	redirect_to project_screenshots_path, notice: "Screenshot was successfully destroyed."
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
