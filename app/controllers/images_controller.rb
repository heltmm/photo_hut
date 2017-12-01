class ImagesController < ApplicationController
   before_action :authorize, only: [:new]
  def index
    @images = Image.most_recent.paginate(:page => params[:page], :per_page => 1)
    @images = Image.search(params[:search], params[:page]) if params[:search].present?
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
    @users = User.all
  end

  def create
   @image = Image.new(image_params)
   if @image.save
     flash[:notice] = "Image Submitted"
     redirect_to images_path
   else
     render :new
   end
 end

  def edit
   @image = Image.find(params[:id])
   @users = User.all
  end

  def update
    @image = Image.find(params[:id])
    @users = User.all
    if @image.update(image_params)
      flash[:notice] = "Image Updated!"
      redirect_to images_path
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Image successfully deleted!"
    redirect_to images_path
  end

  def like
    image = Image.find(params[:id])
    current_user.like!(image)
    redirect_to images_path
  end

  private
  def image_params
    params.require(:image).permit(:description, :photo, :user_id)
  end

end
