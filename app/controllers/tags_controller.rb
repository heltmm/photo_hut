class TagsController < ApplicationController
   before_action :authorize, only: [:new]

  def new
    @users = User.all
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new
  end

  def create
    @users = User.all
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag Submitted"
      redirect_to images_path
    else
      render :new
    end
  end

  def edit
   @tag = Tag.find(params[:id])
  end



  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "Tag successfully deleted!"
    redirect_to images_path
  end

  private
  def tag_params
    params.require(:tag).permit(:user_id)
  end

end
