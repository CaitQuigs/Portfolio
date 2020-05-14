class TagsController < ApplicationController
	before_action :set_tag, only: [:show, :edit, :update, :destroy]
	
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
  	else
  		render 'new'
  	end
  end

  def update
  	if @tag.update(tag_params)
  		redirect_to @tag
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@tag.destroy
  	@project_tags.destroy
  	redirect_to tags_path
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
