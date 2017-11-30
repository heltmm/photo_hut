class UsersController < ApplicationController
  def tag
    @tags = current_user.tags
    @images = []
    @tags.each do |tag|
      @images.push(Image.find(tag.image_id))
    end
  end

  def show
    if current_user
      @images = current_user.images
    end
  end
end
