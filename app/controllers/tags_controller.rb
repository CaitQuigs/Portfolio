class TagsController < ApplicationController
	before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_admin!
	
  def index
  	@tags = Tag.all
  end

  def show
  end

  def new
  	@tag = Tag.new
  end

  def edit
  end

  def create
  	@tag = Tag.new(tag_params)
  	if @tag.save
  		redirect_to '/tags'
      flash[:success] = "Tag was successfully created."
  	else
      flash[:error] = @tag.errors.full_messages
  		render 'new'
  	end
  end

  def update
  	if @tag.update(tag_params)
  		redirect_to @tag
      flash[:success] = "Tag was successfully updated."
  	else
      flash[:error] = @tag.errors.full_messages
  		render 'edit'
  	end
  end

  def destroy
  	@tag.destroy
  	@project_tags.destroy
  	redirect_to tags_path
    flash[:notice] = "Tag was successfully destroyed"
  end

  private
  	def tag_params
  		params.require(:tag).permit(:id, :tag_name,
  			project_tag_attributes: [:id, :tag_id, :project_id])
  	end

  	def set_tag
  		@tag = Tag.find(params[:id])
  		@project_tags = @tag.project_tags.build
  	end
end
