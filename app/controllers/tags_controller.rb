class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tags = current_user.tags
    @tag = current_user.tags.build
  end

  def create
    @tag = current_user.tags.build(tag_params)

    if @tag.save
      flash[:notice] = "Tag created successfully"
      redirect_to tags_path
    else
      flash[:alert] = "Error creating tag"
      render :index
    end
  end

  def edit
    @tag = current_user.tags.find(params[:id])
  end

  def update
    @tag = current_user.tags.find(params[:id])

    if @tag.update(tag_params)
      flash[:notice] = "Tag updated successfully"
      redirect_to tags_path
    else
      flash[:alert] = "Error updating tag"
      render :edit
    end
  end

  def destroy
    @tag = current_user.tags.find(params[:id])
    if @tag.destroy
      flash[:notice] = "Tag deleted"
    else
      flash[:alert] = "Error deleting tag"
    end
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
